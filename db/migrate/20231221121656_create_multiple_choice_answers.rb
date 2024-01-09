class CreateMultipleChoiceAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :multiple_choice_answers do |t|
      t.text :content, comment: 'Value of the answer'
      t.integer :selected_count, comment: 'How many times this answer has been selected'
      t.references :question
      t.references :report
      t.timestamps
    end
  end
end
