class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])

    @answer.user.calculateScore
    @answer.user.save

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

    @answer.user.calculateScore
    @answer.user.save

    respond_to do |format|
      format.html { redirect_to topic_url(@answer.question.topic.id) }
      format.json { head :no_content }
    end
  end
end
