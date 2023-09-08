# frozen_string_literal: true

class TasksController < ApplicationController
  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def show; end

  def destroy; end

  private

  def task_params
    params.require(:task).permit(:name, :start_date, :end_date)
  end
end
