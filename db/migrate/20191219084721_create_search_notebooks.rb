class CreateSearchNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :search_notebooks do |t|
      t.string :title
      t.string :creation_date
      t.integer "search_result_id"
      t.timestamps
    end
  end
end
