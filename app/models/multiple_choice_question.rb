class MultipleChoiceQuestion < Question
  has_many :answers, class_name: 'MultipleChoiceAnswer', foreign_key: 'question_id'
  has_many :selected_answers, class_name: 'MultipleChoiceSelectedAnswer', foreign_key: 'question_id'
end
