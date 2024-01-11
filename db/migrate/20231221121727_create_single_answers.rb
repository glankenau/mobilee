class CreateSingleAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :single_answers do |t|
      t.text :value, comment: 'Value of the answer'
      t.string :type, default: 'DescriptionAnswer'
      t.references :question
      t.references :report
      t.timestamps
    end
  end
end
