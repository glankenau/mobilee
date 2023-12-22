# lib/tasks/create_survey.rake

namespace :survey do
  desc 'Create a survey with questions'
  task create: :environment do
    survey_name = 'Mobility Injustice Report'

    # Create Survey
    survey = Survey.create(name: survey_name)
    puts "Survey '#{survey.name}' created with ID #{survey.id}"

    # Create Open Question
    open_question = OpenQuestion.create(title: 'Please provide your email', number: 1, survey: survey)
    puts "Open Question '#{open_question.title}' created with ID #{open_question.id}"

    # Create Multiple Choice Question for Age
    age_question = MultipleChoiceQuestion.create(title: 'What is your age?', number: 2, survey: survey)
    age_question.answers.create(title: 'Under 18')
    age_question.answers.create(title: '18-24')
    age_question.answers.create(title: '25-34')
    age_question.answers.create(title: '35-44')
    age_question.answers.create(title: '45-54')
    age_question.answers.create(title: '55-64')
    age_question.answers.create(title: '65 or older')
    puts "Multiple Choice Question '#{age_question.title}' created with ID #{age_question.id}"

    # Create Multiple Choice Question for Report Type
    report_type_question = MultipleChoiceQuestion.create(title: 'What type of report do you want to contribute with?', number: 3, survey: survey)
    report_type_question.answers.create(title: 'Environmental Issues', selected_count: 0)
    report_type_question.answers.create(title: 'Social Injustices', selected_count: 0)
    report_type_question.answers.create(title: 'Economic Disparities', selected_count: 0)
    report_type_question.answers.create(title: 'Transportation Challenges', selected_count: 0)
    puts "Multiple Choice Question '#{report_type_question.title}' created with ID #{report_type_question.id}"
  end
end
