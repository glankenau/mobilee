class SurveysController < ApplicationController
  def show
    @survey = Survey.find(permitted_params[:id])
  end

  private

  def permitted_params
    params.permit(:id)
  end
end
