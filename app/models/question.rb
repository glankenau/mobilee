class Question < ApplicationRecord
  belongs_to :survey
  #has_many :multiple_choice_answers
  has_many :single_answers
  #has_many :multiple_choice_selected_answers

  validates :title, presence: true
  validates :number, presence: true
  validates :type, inclusion: { in: ['OpenQuestion', 'MultipleChoiceQuestion']}
end
