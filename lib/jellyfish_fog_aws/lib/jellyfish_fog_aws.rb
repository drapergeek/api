require 'fog'
require 'bcrypt'
require 'jellyfish_fog_aws/engine'
require 'jellyfish_fog_aws/databases'
require 'jellyfish_fog_aws/storage'
require 'jellyfish_fog_aws/infrastructure'

module Jellyfish
  module Fog
    module AWS
      Rails.configuration.x.product_types << [
        DatabaseProductType, StorageProductType, InfrastructureProductType
      ]
    end
  end
end
