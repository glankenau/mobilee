class SingleAnswer < ApplicationRecord
  validates :content, presence: true
end
