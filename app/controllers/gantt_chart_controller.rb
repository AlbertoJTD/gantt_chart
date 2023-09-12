# frozen_string_literal: true

class GanttChartController < ApplicationController
  layout 'gantt'

  def index; end

  def data 
    tasks = Project.find(params[:project_id]).tasks
    links = Link.all
 
    render :json=>{
      :data => tasks.map { |task| {
          :id => task.id,
          :text => task.name,
          :start_date => task.start_date.to_formatted_s(:db),
          :duration => task.duration,
          :progress => task.percentage_completed,
          :parent => task.parent_id,
          :open => true
        }
      },
      :links => links.map{|link|{
        :id => link.id,
        :source => link.source,
        :target => link.target,
        :type => link.link_type
      }}
    }
  end
end
