class AddColumnSearchResultIdToSearchNotebooks < ActiveRecord::Migration[5.2]
  def change
    add_column :search_notebooks, :search_result_id, :integer
  end
end
