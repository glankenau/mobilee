class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.integer :number, null: false, comment: 'Report number'
      t.references :survey
      t.timestamps
    end
  end
end
