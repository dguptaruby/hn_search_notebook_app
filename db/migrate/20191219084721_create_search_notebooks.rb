class CreateSearchNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :search_notebooks do |t|
      t.string :title
      t.string :creation_date
      t.references :search_result, foreign_key: true
      t.references :search_query, foreign_key: true
      t.timestamps
    end
  end
end
