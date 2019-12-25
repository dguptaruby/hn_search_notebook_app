require 'rails_helper'

RSpec.describe SearchNotebook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'Association' do
    describe 'it associated with ' do
      it { should belong_to(:search_query).optional }
      it { should have_many(:search_results) }
    end
  end

  describe 'validation' do
    describe 'it validates with ' do
      it { should validate_uniqueness_of(:title) }
    end
  end 
end
