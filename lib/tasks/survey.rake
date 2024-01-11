# lib/tasks/create_survey.rake

namespace :survey do
  desc 'Create a survey with questions'
  task create: :environment do
    survey_title = 'Mobility Injustice Report'

    # Create Survey
    survey = Survey.create(title: survey_title)
    puts "Survey '#{survey.title}' created with ID #{survey.id}"

    # Create Report
    report = Report.create(number: 1, survey: survey)
    puts "Survey '#{report.number}' created with ID #{report.id}"

    # Create Open Question
    open_question = OpenQuestion.create(title: 'Please provide your email', number: 1, survey: survey)
    puts "Open Question '#{open_question.title}' created with ID #{open_question.id}"

    # Create Multiple Choice Question for Age
    age_question = MultipleChoiceQuestion.create(title: 'What is your age?', number: 2, survey: survey)
    age_question.answers.create(value: 'Under 18')
    age_question.answers.create(value: '18-24')
    age_question.answers.create(value: '25-34')
    age_question.answers.create(value: '35-44')
    age_question.answers.create(value: '45-54')
    age_question.answers.create(value: '55-64')
    age_question.answers.create(value: '65 or older')
    puts "Multiple Choice Question '#{age_question.title}' created with ID #{age_question.id}"

    # Create Multiple Choice Question for Report Type
    report_type_question = MultipleChoiceQuestion.create(title: 'What type of report do you want to contribute with?', number: 3, survey: survey)
    report_type_question.answers.create(value: 'Environmental Issues')
    report_type_question.answers.create(value: 'Social Injustices')
    report_type_question.answers.create(value: 'Economic Disparities')
    report_type_question.answers.create(value: 'Transportation Challenges')
    puts "Multiple Choice Question '#{report_type_question.title}' created with ID #{report_type_question.id}"

    # Create Answer for Email Question
    email_answer = EmailAnswer.create(value: 'glankenau@hey.com', question: open_question, report: report)
    puts "Email Answer '#{email_answer.value}' created with ID #{email_answer.id}"

    # Create Answer for Multiple Choice Question for Age
    age_question_answer = MultipleChoiceSelectedAnswer.create(value: '25-35', question: age_question, report: report)
    puts "Multiple Choice Answer '#{age_question_answer.value}' created with ID #{age_question_answer.id}"

    # Create Answer for Multiple Choice Question for Report Type
    report_question_answer = MultipleChoiceSelectedAnswer.create(value: 'Social Injustices', question: report_type_question, report: report)
    puts "Multiple Choice Answer '#{report_question_answer.value}' created with ID #{report_question_answer.id}"
  end
end
