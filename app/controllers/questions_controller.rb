class QuestionsController < ApplicationController
  def show
    @question = Question.find(permitted_params[:id])
    @num_questions = @question.survey.questions.count
  end

  private

  def permitted_params
    params.permit(:id)
  end
end
