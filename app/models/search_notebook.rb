class SearchNotebook < ApplicationRecord
  has_many :search_results
  belongs_to :search_query, optional: true

  after_save :add_search_result

  validates_uniqueness_of :title

  private

  def add_search_result
  	search_query.search_results.update_all(search_notebook_id: id) unless id.present?
  end
end
