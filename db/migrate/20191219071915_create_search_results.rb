class CreateSearchResults < ActiveRecord::Migration[5.2]
  def change
    create_table :search_results do |t|
      t.string :hn_author
      t.integer :author_karma_points
      t.string :url
      t.string :creation_date
      t.string :hn_tag
      t.timestamps
    end
  end
end
