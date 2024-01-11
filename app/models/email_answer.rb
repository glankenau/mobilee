class EmailAnswer < SingleAnswer
  validates :value, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                                                message:
                                                'is not a valid email address' }
end
