class QuestionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to topic_path }
      format.json { head :no_content }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end

    @question = Question.find(params[:id])

    respond_to do |format|
      format.html { redirect_to topic_url(@question.topic.id, :anchor => "question-#{@question.id}") }
      format.json { head :no_content }
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.create(params[:question])

    @question.user.calculateScore
    @question.user.save

    redirect_to topic_path(@topic, :anchor => "question-#{@question.id}")
  end

  def destroy
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @question = Question.find(params[:id])
    @question.destroy

    @question.user.calculateScore
    @question.user.save

    respond_to do |format|
      format.html { redirect_to topic_url(@question.topic.id) }
      format.json { head :no_content }
    end
  end
end