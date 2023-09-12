class LinkController < ApplicationController
  before_action :set_link, only: %i[update delete]
  protect_from_forgery
 
  def update
    link.source = params["source"]
    link.target = params["target"]
    link.link_type = params["type"]
    link.save

    render :json => {:action => "updated"}
  end

  def add
    link = Link.create( 
        :source => params["source"], 
        :target => params["target"], 
        :link_type => params["type"]
    )

    render :json => {:action => "inserted", :tid => link.id}
  end

  def delete
    link.destroy
    render :json => {:action => "deleted"}
  end

  private

  def link
    @link ||= Link.find(params["id"])
  end
end
