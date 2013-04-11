class HomeController < ApplicationController
  # GET /
  # GET /.json
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @topics }
    end
  end
end
