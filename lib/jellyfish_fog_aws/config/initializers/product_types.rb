# Rails.configuration.x.product_types.merge!({
#   database_product_type: Jellyfish::Fog::AWS::DatabaseProductType,
#   storage_product_type: Jellyfish::Fog::AWS::StorageProductType,
#   infrastructure_product_type: Jellyfish::Fog::AWS::InfrastructureProductType
# })
::ProductType.create(
  description: Jellyfish::Fog::AWS::DatabaseProductType.description,
  name: Jellyfish::Fog::AWS::DatabaseProductType.description,
  questions_form_schema: Jellyfish::Fog::AWS::DatabaseProductType.product_questions
)

::ProductType.create(
  description: Jellyfish::Fog::AWS::StorageProductType.description,
  name: Jellyfish::Fog::AWS::StorageProductType.description,
  questions_form_schema: Jellyfish::Fog::AWS::StorageProductType.product_questions
)

::ProductType.create(
  description: Jellyfish::Fog::AWS::InfrastructureProductType.description,
  name: Jellyfish::Fog::AWS::InfrastructureProductType.description,
  questions_form_schema: Jellyfish::Fog::AWS::InfrastructureProductType.product_questions
)
