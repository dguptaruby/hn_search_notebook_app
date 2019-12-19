require 'open-uri'

class HnSearchApiCallService
  attr_accessor :base_url, :version 

  def initialize
    self.base_url = 'http://hn.algolia.com'
    self.version = 'v1' 
  end

  def search_response(query)
    json_response(search_path(query))
  end 

  private

  def api_url
    "#{base_url}/api/#{version}"
  end   

  def search_path(query)
    "/search?query=#{query}"
  end

  def api_call(api_path)
    open("#{api_url}/#{api_path}").read rescue nil
  end

  def json_response(api_path)
    JSON.parse(api_call(api_path))  
  end   
end  
