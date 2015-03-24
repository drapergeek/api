# Rails.configuration.x.product_types.merge!(ProductType.all.reduce({}) do |product_types_hash, product_type|
#   product_types_hash[product_type.name] = product_type
#   product_types_hash
# end)
