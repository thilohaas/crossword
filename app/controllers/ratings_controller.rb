class RatingsController < ApplicationController
  def new
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @rating = Rating.new
    @rating.rating_type = params[:type]
    @rating.type_id = params[:type_id]
    @rating.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rating }
    end
  end

  def edit
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end

    @rating = Rating.find(params[:id])
  end

  def create
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save

        if @rating.rating_type == 'question'
          @question = Question.find(@rating.type_id)
          @question.user.calculateScore
          @question.user.save
        end
        if @rating.rating_type == 'answer'
          @answer = Answer.find(@rating.type_id)
          @answer.user.calculateScore
          @answer.user.save
        end

        format.html { redirect_to :back, :notice => 'Rating was successfully created.' }
        format.json { render :json => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        if @rating.rating_type == 'question'
          @question = Question.find(@rating.type_id)
          @question.user.calculateScore
          @question.user.save
        end
        if @rating.rating_type == 'answer'
          @answer = Answer.find(@rating.type_id)
          @answer.user.calculateScore
          @answer.user.save
        end

        format.html { redirect_to :back, :notice => 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end
end
