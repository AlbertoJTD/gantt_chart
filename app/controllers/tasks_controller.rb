# frozen_string_literal: true

class TasksController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :add
  protect_from_forgery

  def update
    task = Task.find(params["id"])
    task.name = params["text"]
    task.start_date = params["start_date"]
    task.end_date = params["end_date"]
    task.duration = params["duration"]
    task.percentage_completed = params["progress"] || 0
    task.parent_id = params["parent"]
    task.save

    render :json => {:action => "updated"}
  end

  def add
    @task_created = Task.create( 
      :name => params["text"], 
      :start_date => params["start_date"],
      :end_date => params["end_date"],
      :duration => params["duration"],
      :percentage_completed => params["progress"], 
      :parent_id => params["parent"],
      :project_id => params["project_id"]
    )
    pry
    render :json => {:action => "inserted", :tid => @task_created.id}
  end

  def delete
    Task.find(params["id"]).destroy
    render :json => {:action => "deleted"}
  end

  # private

  # def task
  #   @task ||= Task.find(params[:id])
  # end
end
