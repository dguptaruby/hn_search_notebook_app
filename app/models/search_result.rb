class SearchResult < ApplicationRecord
  belongs_to :search_query, optional: true
  belongs_to :search_notebook, optional: true
end
