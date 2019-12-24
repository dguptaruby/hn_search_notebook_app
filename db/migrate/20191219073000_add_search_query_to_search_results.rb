class AddSearchQueryToSearchResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :search_results, :search_query, foreign_key: true
  end
end
