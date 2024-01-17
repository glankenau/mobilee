class AnswerCreator

  def initialize(question, params, report)
    @question = question
    @params = params
    @report = report
  end

  def call
    case
    when @question.type == 'EmailQuestion'
      @answer = EmailAnswer.create(value: @params[:email], report: @report, question: @question)
    when @question.type == 'MultipleChoiceQuestion'
      @option = MultipleChoiceOption.find_by(id: @params[:selected_option])
      @answer = MultipleChoiceAnswer.create(value: @option.value, report: @report, question: @question)
    end

    @answer
  end
end
