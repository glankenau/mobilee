class MultipleChoiceAnswer < ApplicationRecord
  belongs_to :question, foreign_key: 'question_id'
  belongs_to :report
  validates :content, presence: true
end
