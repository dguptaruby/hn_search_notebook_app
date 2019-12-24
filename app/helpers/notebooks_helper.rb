module NotebooksHelper
  def is_params?
    params.present?
  end

  def search_query_range
    range_limit = (SearchQuery.all.map(&:query_string).uniq.count./10.0).ceil*10
    (10..range_limit).step(10).to_a
  end
end
