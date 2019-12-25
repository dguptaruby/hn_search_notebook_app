require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'Association' do
    describe 'it associated with ' do
      it { should have_one(:search_notebook) }
      it { should have_one(:hits_record) }
      it { should have_many(:search_results) }
    end
  end

  describe 'validation' do
    describe 'it validates with ' do
      it { should validate_presence_of(:query_string) }
    end
  end

end
