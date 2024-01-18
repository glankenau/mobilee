class MultipleChoiceOption < ApplicationRecord
  belongs_to :question, foreign_key: 'question_id'
  validates :value, presence: true
end
