Rails.configuration.x.product_types.merge!({
  database_product_type: Jellyfish::Fog::AWS::DatabaseProductType,
  storage_product_type: Jellyfish::Fog::AWS::StorageProductType,
  infrastructure_product_type: Jellyfish::Fog::AWS::InfrastructureProductType
})
