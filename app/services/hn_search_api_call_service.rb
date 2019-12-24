require 'open-uri'

class HnSearchApiCallService
  attr_accessor :base_url, :version 

  class << self
    def search_response(query)
      new.json_response(new.search_path(query))
    end

    def query_response_last_day(query)
      new.json_response(new.query_hit_last_day_path(query))
    end

    def query_response_last_week(query)
      new.json_response(new.query_hit_last_week_path(query))
    end
  end   

  def initialize
    self.base_url = 'http://hn.algolia.com'
    self.version = 'v1' 
  end

  def api_url
    "#{base_url}/api/#{version}"
  end   

  def search_path(query)
    "/search?query=#{query}"
  end

  def query_hit_last_day_path(query)
    time = (DateTime.now - 1.day).to_time.to_i
    "/search_by_date?query=story&numericFilters=created_at_i>#{time}"
  end

  def query_hit_last_week_path(query)
    start_time = (DateTime.now).to_time.to_i
    end_time = (DateTime.now - 7.days).to_time.to_i
    "/search_by_date?query=story&numericFilters=created_at_i>#{end_time},created_at_i<#{start_time}"
  end

  def api_call(api_path)
    open("#{api_url}/#{api_path}").read rescue nil
  end

  def json_response(api_path)
    JSON.parse(api_call(api_path))  
  end
end