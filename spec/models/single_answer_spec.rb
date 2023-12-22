# spec/models/single_answer_spec.rb

require 'rails_helper'

RSpec.describe SingleAnswer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
