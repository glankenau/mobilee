# spec/models/email_answer_spec.rb

require 'rails_helper'

RSpec.describe EmailAnswer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }

    it do
      should allow_value('valid@example.com', 'another_valid@example.co.uk')
        .for(:content)
    end

    it do
      should_not allow_value('invalid_email', 'invalid@.com', 'invalid@com')
        .for(:content)
        .with_message('is not a valid email address')
    end
  end
end
