# frozen_string_literal: true

class MppFileHandlerService
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
      create_tasks_recursive(task, @project.id)
    end
  end

  def create_tasks_recursive(task, project_id, parent = nil)
    project_task = Task.create(name: task.name, start_date: task.start, end_date: task.finish, duration: task.duration, completed: task_completed?(task),
                               project_id:, percentage_completed: task.percent_complete, parent_id: parent)

    return unless task.child_tasks

    task.child_tasks.each do |child|
      create_tasks_recursive(child, project_id, project_task.id)
    end
  end

  def task_completed?(task)
    task.percent_complete == 100
  end
end
