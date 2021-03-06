class CreateSearchResults < ActiveRecord::Migration[5.2]
  def change
    create_table :search_results do |t|
      t.string :hn_author
      t.integer :author_karma_points
      t.string :url
      t.string :creation_date
      t.string :hn_tag
      t.references :search_notebook, foreign_key: true
      t.references :search_query, foreign_key: true
      t.timestamps
    end
  end
end
