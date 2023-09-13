# frozen_string_literal: true

class LinkController < ApplicationController
  before_action :link, only: %i[update delete]
  protect_from_forgery

  def update
    link.source_id = params['source']
    link.target_id = params['target']
    link.link_type = params['type']
    link.project_id = params[:project_id]
    link.save

    render json: { action: 'updated' }
  end

  def add
    link = Link.create(
      source_id: params['source'],
      target_id: params['target'],
      link_type: params['type'],
      project_id: params[:project_id]
    )

    render json: { action: 'inserted', tid: link.id }
  end

  def delete
    link.destroy
    render json: { action: 'deleted' }
  end

  private

  def link
    @link ||= Link.find(params['id'])
  end
end
