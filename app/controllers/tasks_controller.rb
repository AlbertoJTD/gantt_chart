# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update show destroy]

  def index; end

  def new
    @task = Task.new
  end

  def create
    if project.tasks.create(task_params)
      redirect_to project_path(project), notice: 'Task created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update; end

  def show; end

  def destroy; end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :start_date, :end_date, :completed, :description, :project_id)
  end
end
