class CreateHitsRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :hits_records do |t|
      t.references :search_query, foreign_key: true
      t.integer :last_day
      t.integer :last_week

      t.timestamps
    end
  end
end
