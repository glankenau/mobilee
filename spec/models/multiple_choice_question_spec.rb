# spec/models/multiple_choice_question_spec.rb

require 'rails_helper'

RSpec.describe MultipleChoiceQuestion, type: :model do
  describe 'associations' do
    it { should have_many(:options).class_name('MultipleChoiceOption').with_foreign_key('question_id') }
  end
end
