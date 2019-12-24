class QueryStatisticsJob < ApplicationJob
  queue_as :default

  def perform(query)
    search_query = SearchQuery.find_by(query_string: query)
    if search_query.present?
      last_day_data = HnSearchApiCallService.query_response_last_day(query)
      last_week_data = HnSearchApiCallService.query_response_last_week(query)
      update_hits_records(search_query, last_day_data['nbHits'], last_week_data['nbHits'])
    end
  end

  def update_hits_records(search_query, last_day_hits, last_week_hits)
    puts "creating hits record for #{search_query.query_string}"
    if search_query.hits_record
      search_query.hits_record.update(last_day: last_day_hits, last_week: last_week_hits)
    else
      HitsRecord.create(search_query: search_query, last_day: last_day_hits, last_week: last_week_hits)
    end
  end
end
