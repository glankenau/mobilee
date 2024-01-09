class QuestionsController < ApplicationController

  def show
    @question = Question.find(permitted_params[:id])
  end

  private

  def permitted_params
    params.permit(:id)
  end
end
