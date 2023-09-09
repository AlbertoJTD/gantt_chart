# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # url_for(user.avatar)
    # url_for(@project.file)
    if @project.save
      require 'active_support'
      require 'mpxj'

      file_path = ActiveStorage::Blob.service.send(:path_for, @project.file.key)

      project = MPXJ::Reader.read(file_path, nil, :days)
      # project = MPXJ::Reader.read(@archivo_path, nil, :days)
      # project = MPXJ::Reader.read('DemoProject.mpp', nil, :days)

      puts "There are #{project.all_tasks.size} tasks in this project"
      puts "There are #{project.all_resources.size} resources in this project"

      puts "\nThe resources are:"
      project.all_resources.each do |resource|
        puts resource.name
      end

      puts "The tasks are:"
      project.all_tasks.each do |task|
        # puts task.properties
        # break
        puts "* #{task.name}: starts on #{task.start}, finishes on #{task.finish}, it's duration is #{task.duration}, the percentage completed is: #{task.percent_complete}"
      end
      redirect_to projects_path, notice: 'Project created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tasks = @project.tasks
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to edit_project_path(@project), notice: 'Project updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path, notice: 'Project destroyed'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :file)
  end
end
