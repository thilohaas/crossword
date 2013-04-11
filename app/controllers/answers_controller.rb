class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])
    redirect_to topic_question_path(@question.topic, @question)
  end
end
