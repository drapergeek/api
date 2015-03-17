Rails.configuration.x.product_types.merge!(ProductType.all.reduce({}) do |pt_hash, pt|
  pt_hash[pt.name] = pt
  pt_hash
end)
