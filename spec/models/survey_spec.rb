# spec/models/survey_spec.rb

require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'associations' do
    it { should have_many(:multiple_choice_questions).class_name('MultipleChoiceQuestion') }
    it { should have_many(:open_questions).class_name('OpenQuestion') }
    it { should have_many(:questions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
