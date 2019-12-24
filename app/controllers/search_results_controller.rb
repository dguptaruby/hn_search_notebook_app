class SearchResultsController < ApplicationController

  def index
    @json_data = HnSearchApiCallService.search_response(params[:search])
  end

  def create
    @search_result = SearchResult.new(search_result_params)
    @search_result.save!
  end

  def show
    @search_result = SearchResult.find(params[:id])
  end

  private

  def search_result_params
    params.require(:search_result).permit(:hn_author, :author_karma_points, :url, :creation_date, :hn_tag, :search_notebook_id)
  end
end
