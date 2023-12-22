# spec/models/multiple_choice_answer_spec.rb

require 'rails_helper'

RSpec.describe MultipleChoiceAnswer, type: :model do
  describe 'associations' do
    it { should belong_to(:question).with_foreign_key('question_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:selected_count) }

    it do
      should validate_numericality_of(:selected_count)
        .is_greater_than_or_equal_to(0)
        .with_message('must be greater than or equal to 0')
    end
  end
end
