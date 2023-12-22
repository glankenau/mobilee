class OpenQuestion < Question
  has_many :answers, class_name: 'SingleAnswer', foreign_key: 'question_id'
end
