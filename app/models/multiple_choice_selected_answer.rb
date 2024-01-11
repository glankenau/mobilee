class MultipleChoiceSelectedAnswer < ApplicationRecord
  belongs_to :question, foreign_key: 'question_id'
  belongs_to :report
  validates :value, presence: true
end
