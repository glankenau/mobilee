class Question < ApplicationRecord
  has_many :answers
  belongs_to :survey

  validates :title, presence: true
  validates :number, presence: true
  validates :type, inclusion: { in: %w[OpenQuestion MultipleChoiceQuestion] }
end
