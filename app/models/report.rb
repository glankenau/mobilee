class Report < ApplicationRecord
  belongs_to :survey
  has_many :multiple_choice_answers
  has_many :single_answers
end
