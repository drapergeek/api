require 'fog'
require 'bcrypt'
require 'jellyfish_fog_aws/engine'
require 'jellyfish_fog_aws/databases'
require 'jellyfish_fog_aws/storage'
require 'jellyfish_fog_aws/infrastructure'

module Jellyfish
  module Fog
    module AWS
      # Rails.configuration.x.product_types.lazy.merge!({
      #   database_product_type: ::Jellyfish::Fog::AWS::DatabaseProductType
      # })

      # Rails.configuration.x.product_types.merge!({
      #   database_product_type: DatabaseProductType,
      #   storage_product_type: StorageProductType,
      #   infrastructure_product_type: InfrastructureProductType
      # })
    end
  end
end
