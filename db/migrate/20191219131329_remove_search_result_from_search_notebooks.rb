class RemoveSearchResultFromSearchNotebooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :search_notebooks, :search_result, foreign_key: true
  end
end
