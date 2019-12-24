class NotebooksController < ApplicationController
  before_action :set_search_query, only: [:new, :create]
  before_action :set_search_notebook, only: [:show, :destroy, :destroy_result, :set_search_result]
  before_action :set_search_result, only: [:destroy_result]

  def index
    @notebooks = SearchNotebook.all
  end

  def new
    @notebook = SearchNotebook.new
  end 

  def show
  end

  def create
    @notebook = SearchNotebook.new(notebook_params)
    @notebook.save!
    redirect_to notebooks_path
  end

  def destroy
    @search_notebook.destroy
    redirect_to notebooks_path
  end

  def destroy_result
    @search_result.destroy
    redirect_to notebook_path
  end

  def statistics
    @start_range = params[:notebooks] ? params[:notebooks]['digit'].to_i : 0
    end_range = @start_range + 9
    @data = SearchQuery.get_hits_record_by(@start_range, end_range)
  end

  private

  def set_search_notebook
    @search_notebook = SearchNotebook.find(params[:id])
  end      

  def set_search_query
    query = params[:search_notebook][:search_result_ids] unless params.present?
    @search_query = SearchQuery.find_by(query_string: query)
  end      

  def set_search_result
    @search_result = @search_notebook.search_results.find(params[:result_id])
  end

  def notebook_params
    params.require(:search_notebook).permit(:title, :creation_date, :search_query_id)
  end
end
