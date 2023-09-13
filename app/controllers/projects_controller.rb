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

    if @project.save
      MppFileHandlerService.new(@project).read_project

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
      redirect_to projects_path, notice: 'Project updated successfully'
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
