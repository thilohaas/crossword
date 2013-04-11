class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])
    redirect_to topic_question_path(@question.topic, @question)
  end

  def destroy
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
      return
    end
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to topic_url(@answer.question.topic.id) }
      format.json { head :no_content }
    end
  end
end
