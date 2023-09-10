class MppFileHandler
  require 'active_support'
  require 'mpxj'

  def initialize(project)
    @project = project
    @mpp_file = nil
  end

  def read_project
    @mpp_file = MPXJ::Reader.read(file_path, nil, :days)
    update_project!
    create_tasks!
  end

  private

  def file_path
    ActiveStorage::Blob.service.send(:path_for, @project.file.key)
  end

  def update_project!
    file_info = @mpp_file.properties

    @project.update(start_date: file_info.start_date.to_datetime, end_date: file_info.finish_date.to_datetime)
  end

  def project_file_info
    @mpp_file.all_tasks.first.child_tasks
  end

  def create_tasks!
    project_file_info.each do |task|
      Task.create(name: task.name, start_date: task.start, end_date: task.finish, completed: task_completed?(task),
                  project_id: @project.id)

      if task.child_tasks
        task.child_tasks.each do |child|
          Task.create(name: child.name, start_date: child.start, end_date: child.finish, completed: task_completed?(child),
                      project_id: @project.id)

          if child.child_tasks
            child.child_tasks.each do |sub_task|
              Task.create(name: sub_task.name, start_date: sub_task.start, end_date: sub_task.finish, completed: task_completed?(sub_task),
                          project_id: @project.id)

              if sub_task.child_tasks
                sub_task.child_tasks.each do |another_task|
                  Task.create(name: another_task.name, start_date: another_task.start, end_date: another_task.finish, completed: task_completed?(another_task),
                              project_id: @project.id)
                end
              end
            end
          end
        end
      end
    end
  end

  def task_completed?(task)
    task.percent_complete == 100
  end
end
