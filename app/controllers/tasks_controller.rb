# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update show destroy]

  def index
    project_taks = project.tasks
    respond_to do |format|
      format.json { render json: project_taks, status: :ok }
    end
  end

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

  def show; end

  # def destroy; end

  # API Methods
  protect_from_forgery

  def update
    task.name = params["text"]
    task.start_date = params["start_date"]
    task.duration = params["duration"]
    task.percentage_completed = params["progress"] || 0
    task.parent_id = params["parent"]
    task.save

    render :json => {:action => "updated"}
  end

  def add
    task_created = task.create( 
      :name => params["text"], 
      :start_date=> params["start_date"], 
      :duration => params["duration"],
      :percentage_completed => params["progress"] || 0, 
      :parent_id => params["parent"]
    )

    render :json => {:action => "inserted", :tid => task_created.id}
  end

  def delete
    task.destroy
    render :json => {:action => "deleted"}
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :start_date, :end_date, :completed, :description, :project_id)
  end
end
