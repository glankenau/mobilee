class AnswersController < ApplicationController
  def create
    @question = Question.find(permitted_params[:question_id])
    @survey = @question.survey
    if !cookies[:report_number]
      @report = Report.create(survey_id: @survey.id, number: 0)
      @report.update(number: @report.id)
      cookies[:report_number] = @report.id
    else
      @report = Report.find_by(number: cookies[:report_number])
    end

    AnswerCreator.new(@question, permitted_params, @report).call
    if @survey.next_question(@question).present?
      redirect_to question_path(@survey.next_question(@question))
    else
      cookies.delete(:report_number)
      redirect_to thanks_path
    end
  end

  def permitted_params
    params.permit(:email, :question_id, :selected_option)
  end
end
