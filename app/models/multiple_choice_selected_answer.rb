class MultipleChoiceSelectedAnswer < ApplicationRecord
  belongs_to :question, foreign_key: 'question_id'
  belongs_to :report
  validates :title, presence: true
end
