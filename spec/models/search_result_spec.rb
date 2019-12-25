require 'rails_helper'

RSpec.describe SearchResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'Association' do
    describe 'it associated with ' do
      it { should belong_to(:search_query).optional }
      it { should belong_to(:search_notebook).optional }
    end
  end
end
