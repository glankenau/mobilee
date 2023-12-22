class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys, comment: 'List of Surveys' do |t|
      t.text :title, null: false, comment: 'Survey Title'
      t.timestamps
    end
  end
end
