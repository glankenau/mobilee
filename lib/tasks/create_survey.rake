# lib/tasks/create_survey.rake

namespace :survey do
  desc 'Create a survey with questions'
  task create: :environment do
    survey_name = 'Mobility Injustice Report'

    # Create Survey
    survey = Survey.create(title: survey_name)
    puts "Survey '#{survey.name}' created with ID #{survey.id}"

    # Create Report
    report = Report.create(number: 1, survey: survey)
    puts "Survey '#{report.number}' created with ID #{report.id}"

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
    report_type_question.answers.create(title: 'Environmental Issues')
    report_type_question.answers.create(title: 'Social Injustices')
    report_type_question.answers.create(title: 'Economic Disparities')
    report_type_question.answers.create(title: 'Transportation Challenges')
    puts "Multiple Choice Question '#{report_type_question.title}' created with ID #{report_type_question.id}"

    # Create Answer for Email Question
    email_answer = EmailAnswer.create(content: 'glankenau@hey.com', question: open_question, report: report)
    puts "Email Answer '#{email_answer.title}' created with ID #{email_answer.id}"

    # Create Answer for Multiple Choice Question for Age
    age_question_answer = MultipleChoiceSelectedAnswer.create(title: '25-35', question: age_question, report: report)
    puts "Multiple Choice Answer '#{age_question_answer.title}' created with ID #{age_question_answer.id}"

    # Create Answer for Multiple Choice Question for Report Type
    report_question_answer = MultipleChoiceSelectedAnswer.create(title: 'Social Injustices', question: report_type_question, report: report)
    puts "Multiple Choice Answer '#{report_question_answer.title}' created with ID #{report_question_answer.id}"
  end
end
