class RemoveSearchResultIdFromSearchNotebooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :search_notebooks, :search_result_id, :integer
  end
end
