::ProductType.create_with(
  questions_form_schema: Jellyfish::Fog::AWS::DatabaseProductType.product_questions
).find_or_create_by!(
  description: Jellyfish::Fog::AWS::DatabaseProductType.description,
  name: Jellyfish::Fog::AWS::DatabaseProductType.description,
)

::ProductType.create_with(
  questions_form_schema: Jellyfish::Fog::AWS::StorageProductType.product_questions
).find_or_create_by!(
  description: Jellyfish::Fog::AWS::StorageProductType.description,
  name: Jellyfish::Fog::AWS::StorageProductType.description,
)

::ProductType.create_with(
  questions_form_schema: Jellyfish::Fog::AWS::InfrastructureProductType.product_questions
).find_or_create_by!(
  description: Jellyfish::Fog::AWS::InfrastructureProductType.description,
  name: Jellyfish::Fog::AWS::InfrastructureProductType.description,
)
