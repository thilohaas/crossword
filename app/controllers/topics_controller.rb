class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  def index
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end

    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, :notice => 'Topic was successfully created.' }
        format.json { render :json => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.json { render :json => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, :notice => 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
end
