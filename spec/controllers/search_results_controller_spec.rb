require 'rails_helper'

RSpec.describe SearchResultsController, type: :controller do

require 'rails_helper'

  describe 'GET #index' do 
    before do
      get :index
    end

    it 'is expected to assign search_result instance variable' do
      expect(response.status).to eq(200)
    end
  end

  describe "search result Create" do
    context "when params are correct " do

      it 'should create an search notebook' do
        post :create, params: {search_result: {hn_author: "pill", creation_date: DateTime.now, author_karma_points: 2400, url: 'http://pill.com', hn_tag:['story',1,3], search_query_id: 1, search_notebook_id: 2 }}
        expect(SearchResult.count).to eq(1)
      end

      it 'is expected to have params assigned to it' do
        post :create, params: {search_result: {hn_author: "pill", creation_date: DateTime.now, author_karma_points: 2400, url: 'http://pill.com', hn_tag:['story',1,3], search_query_id: 1, search_notebook_id: 2 }}
        expect(SearchResult.last.hn_author).to eq("pill")
        expect(SearchResult.last.author_karma_points).to eq(2400)  
        expect(SearchResult.last.search_notebook_id).to eq(2)
      end
	 end
  end
end
