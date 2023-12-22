# spec/models/question_spec.rb

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should belong_to(:survey) }
    it { should have_many(:multiple_choice_answers) }
    it { should have_many(:single_answers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:number) }

    # it do
    #   should validate_inclusion_of(:type)
    #     .in_array(['OpenQuestion', 'MultipleChoiceQuestion'])
    #     .with_message('is not included in the list: OpenQuestion, MultipleChoiceQuestion')
    # end
  end
end
