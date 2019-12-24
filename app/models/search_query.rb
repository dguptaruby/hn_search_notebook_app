class SearchQuery < ApplicationRecord
  has_one :search_notebook
  has_many :search_results
  has_one :hits_record

  validates :query_string, presence: true

  def self.get_hits_record_by(start_range, end_range)
    arr = Array.new

    all[start_range..end_range].each do |search_query|
      if search_query.hits_record.present?
        create_record_hash(arr, search_query)
      end
    end
    arr
  end

  def self.create_record_hash(arr, search_query)
    query_data = Hash.new
    query_data[:last_day] = search_query.hits_record.last_day
    query_data[:last_week] = search_query.hits_record.last_week

    %i[last_day last_week].each do |statistic|
      arr <<  { name: statistic.to_s.humanize, 
                data: {"#{search_query.query_string}"=>query_data[statistic]} 
              }
    end    
  end
end
