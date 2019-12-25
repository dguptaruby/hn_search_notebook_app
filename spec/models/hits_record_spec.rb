require 'rails_helper'

RSpec.describe HitsRecord, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'Association' do
    describe 'it associated with ' do
      it { should belong_to(:search_query) }
    end
  end
end
