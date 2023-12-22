class MultipleChoiceAnswer < ApplicationRecord
  belongs_to :question, foreign_key: 'question_id'
  validates :title, presence: true
  validates :selected_count, presence: true
  validates :selected_count, numericality: { greater_than_or_equal_to: 0,
                                             message: 'must be greater than or equal to 0' }
end
