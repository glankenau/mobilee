class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report
  validates :value, presence: true
  validates :type, inclusion: { in: %w[EmailAnswer LocationAnswer DescriptionAnswer MediaAnswer MultipleChoiceAnswer] }
end
