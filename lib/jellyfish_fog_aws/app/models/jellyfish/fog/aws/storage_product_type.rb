module Jellyfish
  module Fog
    module AWS
      class StorageProductType < ProductType
        DESCRIPTION = 'Storage'.freeze
        PRODUCT_CLASS = StorageProduct
        PRODUCT_QUESTIONS = JSON.parse(
          File.read(
            Jellyfish::Fog::AWS::Engine.root.join(
              *%w(config order_item_questions storage.json)
            )
          )
        ).freeze

        def self.description
          DESCRIPTION
        end

        def self.product_questions
          PRODUCT_QUESTIONS
        end
      end
    end
  end
end
