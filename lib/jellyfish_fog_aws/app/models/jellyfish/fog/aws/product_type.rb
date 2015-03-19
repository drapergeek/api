module Jellyfish
  module Fog
    module AWS
      class ProductType
        def self.to_json
          Jbuilder.new do |product_type|
            product_type.name 'Database Product Type'
            product_type.description description
            product_type.formSchema product_questions
          end.attributes!
        end
      end
    end
  end
end
