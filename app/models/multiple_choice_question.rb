class MultipleChoiceQuestion < Question
  has_many :answers, class_name: 'MultipleChoiceAnswer', foreign_key: 'question_id'
end
