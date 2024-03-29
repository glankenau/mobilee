# spec/factories/factories.rb

FactoryBot.define do
  factory :survey do
    title { 'Mobility Injustice Report' }

    trait :with_open_question do
      after(:create) do |survey|
        create(:open_question, survey: survey)
      end
    end

    trait :with_multiple_choice_questions do
      after(:create) do |survey|
        create(:multiple_choice_question_age, survey: survey)
        create(:multiple_choice_question_report_type, survey: survey)
      end
    end
  end

  factory :open_question, class: 'EmailQuestion' do
    title { 'Please provide your email' }
    number { 1 }
  end

  factory :multiple_choice_question_age, class: 'MultipleChoiceQuestion' do
    title { 'What is your age?' }
    number { 2 }

    after(:create) do |question|
      create_list(:multiple_choice_option, 7, question: question, value: 'Under 18')
    end
  end

  factory :multiple_choice_question_report_type, class: 'MultipleChoiceQuestion' do
    title { 'What type of report do you want to contribute with?' }
    number { 3 }

    after(:create) do |question|
      create_list(:multiple_choice_option, 4, question: question, value: 'Environmental Issues')
    end
  end

  factory :multiple_choice_option do
    value { 'Under 18' }
  end
end
