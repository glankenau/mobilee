class Report < ApplicationRecord
  has_many :answers
  belongs_to :survey
end
