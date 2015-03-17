require 'spec_helper'

module Jellyfish
  module Fog
    module AWS
      describe 'Registering product types' do
        it 'registers all product types' do
          expect(Dummy.config.x.product_types).to include(DatabaseProductType)
        end
      end
    end
  end
end
