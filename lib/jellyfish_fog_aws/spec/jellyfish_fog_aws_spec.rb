require 'spec_helper'

module Jellyfish
  module Fog
    module AWS
      describe 'Registering product types' do
        it 'registers all product types' do
          vals = Dummy::Application.config.x.product_types.values
          puts vals.inspect
          expect(vals).to include(DatabaseProductType)
        end
      end
    end
  end
end
