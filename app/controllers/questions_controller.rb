class QuestionsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.create(params[:question])
    redirect_to topic_path(@topic)
  end
end