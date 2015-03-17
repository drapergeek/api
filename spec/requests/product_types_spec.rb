require 'rails_helper'

RSpec.describe 'Projects API' do
  describe 'GET index' do
    before(:all) do
      create(:product_type, questions_form_schema: { hi: :britton })
    end

    it 'returns a collection of all product types' do
      sign_in_as create(:staff, :admin)

      get '/product_types'

      ap json
    end
  end
end
