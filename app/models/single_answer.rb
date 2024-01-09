class SingleAnswer < ApplicationRecord
  belongs_to :question, class_name: 'OpenQuestion', foreign_key: 'question_id'
  belongs_to :report
  validates :content, presence: true

  validates :type, inclusion: { in: ['EmailAnswer', 'LocationAnswer', 'DescriptionAnswer', 'MediaAnswer']}
end
