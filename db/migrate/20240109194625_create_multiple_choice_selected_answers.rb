class CreateMultipleChoiceSelectedAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :multiple_choice_selected_answers do |t|
      t.text :value, null: false
      t.references :question
      t.references :report
      t.timestamps
    end
  end
end
