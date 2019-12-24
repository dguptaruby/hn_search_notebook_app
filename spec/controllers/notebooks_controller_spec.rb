require 'rails_helper'

RSpec.describe NotebooksController, type: :controller do

  describe 'GET #index' do 
    before do
      get :index
    end

    it 'is expected to assign notebooks instance variable' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end
  end

  describe "Search Notebook Create" do
    context "when params are correct " do

      it 'should create an search notebook' do
        post :create, params: {search_notebook: {title: "Sports", creation_date: DateTime.now, search_query_id: 1 }}
        expect(SearchNotebook.count).to eq(1)
      end

      it 'is expected to have params assigned to it' do
        post :create, params: {search_notebook: {title: "Sports", creation_date: DateTime.now, search_query_id: 1 }}
        expect(SearchNotebook.last.title).to eq('Sports')
        expect(SearchNotebook.last.search_query_id).to eq(1)    
      end
    end
  end

  describe "Search Notebook Destroy" do
    context "when params are correct " do

      it 'should delete an search notebook' do
        post :create, params: {search_notebook: {title: "Sports", creation_date: DateTime.now, search_query_id: 1 }}
        expect(SearchNotebook.count).to eq(1)
        delete :destroy, params: { id: SearchNotebook.last.id }
        expect(SearchNotebook.count).to eq(0)
      end
    end
  end
end
