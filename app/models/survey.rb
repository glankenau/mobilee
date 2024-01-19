class Survey < ApplicationRecord
  has_many :multiple_choice_questions, class_name: 'MultipleChoiceQuestion'
  # has_many :open_questions, class_name: 'OpenQuestion'
  has_many :questions
  has_many :reports

  validates :title, presence: true

  def next_question(current_question)
    current_position = current_question.number
    next_question = questions.find_by(number: current_position + 1)

    # Return the next question or nil if there is no next question
    return next_question if next_question.present?

    # If there is no next question, return nil
    nil
  end
end
