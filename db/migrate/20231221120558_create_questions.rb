class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, comment: 'List of Questions for a given Survey' do |t|
      t.text :title, comment: 'Question Title'
      t.integer :number, comment: 'Number of question in survey'
      t.string :type, default: 'OpenQuestion', comment: 'Type of question.'
      t.references :survey
      t.timestamps
    end
  end
end
