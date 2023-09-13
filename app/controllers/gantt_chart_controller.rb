# frozen_string_literal: true

class GanttChartController < ApplicationController
  layout 'gantt'

  def index
    @project = Project.find(params[:project_id])
  end

  def data
    project = Project.find(params[:project_id])
    tasks = project.tasks
    links = project.links
 
    render :json=>{
      :data => tasks.map { |task| {
          :id => task.id,
          :text => task.name,
          :start_date => task.start_date.to_formatted_s(:db),
          :duration => task.duration,
          :progress => task.percentage_completed.to_f / 100,
          :parent => task.parent_id,
          :open => true
        }
      },
      :links => links.map{|link|{
        :id => link.id,
        :source => link.source_id,
        :target => link.target_id,
        :type => link.link_type
      }}
    }
  end
end
