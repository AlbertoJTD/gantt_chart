# frozen_string_literal: true

class TasksController < ApplicationController
  protect_from_forgery

  def update
    task = Task.find(params['id'])
    task.name = params['text']
    task.start_date = params['start_date']
    task.end_date = params['end_date']
    task.duration = params['duration']
    task.percentage_completed = params['progress'] || 0
    task.save

    render json: { action: 'updated' }
  end

  def add
    parent_id = params['parent'].to_i.positive? ? params['parent'] : nil
    task_created = Task.create(
      name: params['text'],
      start_date: params['start_date'],
      end_date: params['end_date'],
      duration: params['duration'],
      percentage_completed: params['progress'],
      parent_id: parent_id,
      project_id: params['project_id']
    )

    render json: { action: 'inserted', tid: task_created.id }
  end

  def delete
    Task.find(params[:id]).destroy
    render json: { action: 'deleted' }
  end
end
