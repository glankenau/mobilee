# spec/models/multiple_choice_answer_spec.rb

require 'rails_helper'

RSpec.describe MultipleChoiceAnswer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:value) }
  end
end
