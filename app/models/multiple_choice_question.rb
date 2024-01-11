class MultipleChoiceQuestion < Question
  has_many :options, class_name: 'MultipleChoiceOption', foreign_key: 'question_id'
end
