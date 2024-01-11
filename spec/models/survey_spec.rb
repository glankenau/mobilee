# spec/models/survey_spec.rb

require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'associations' do
    it { should have_many(:multiple_choice_questions).class_name('MultipleChoiceQuestion') }
    it { should have_many(:open_questions).class_name('OpenQuestion') }
    it { should have_many(:questions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
  describe 'instances' do
    it 'creates a survey with open and multiple-choice questions' do
      survey = create(:survey, :with_open_question, :with_multiple_choice_questions)

      # Add your expectations/assertions here based on your specific needs
      expect(survey.title).to eq('Mobility Injustice Report')
      expect(survey.questions.count).to eq(3) # 1 open question + 2 multiple-choice questions
    end
  end
end
