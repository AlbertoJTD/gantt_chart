# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def show; end

  def destroy; end

  private

  def project_params
    params.require(:category).permit(:name, :start_date, :end_date)
  end
end
