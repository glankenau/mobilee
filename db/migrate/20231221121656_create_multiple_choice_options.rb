class CreateMultipleChoiceOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :multiple_choice_options do |t|
      t.text :value, comment: 'Value of the answer'
      t.references :question
      t.timestamps
    end
  end
end
