class Survey < ApplicationRecord
  has_many :multiple_choice_questions, class_name: 'MultipleChoiceQuestion'
  has_many :open_questions, class_name: 'OpenQuestion'
  has_many :questions
  has_many :reports

  validates :title, presence: true
end
