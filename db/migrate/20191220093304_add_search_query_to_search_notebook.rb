class AddSearchQueryToSearchNotebook < ActiveRecord::Migration[5.2]
  def change
    add_reference :search_notebooks, :search_query, foreign_key: true
  end
end
