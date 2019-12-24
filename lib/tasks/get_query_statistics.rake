namespace :get_query_statistics do
  desc "TODO"
  task time_based_data: :environment do
    query_strings = SearchQuery.all.map(&:query_string).uniq
    query_strings.each do |query_string|
      QueryStatisticsJob.perform_now query_string
    end
  end
end
