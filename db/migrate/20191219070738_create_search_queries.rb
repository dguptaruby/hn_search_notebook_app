class CreateSearchQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :search_queries do |t|
      t.string :query_string
      t.string :creation_date
      t.string :total_hits
      t.timestamps
    end
  end
end
