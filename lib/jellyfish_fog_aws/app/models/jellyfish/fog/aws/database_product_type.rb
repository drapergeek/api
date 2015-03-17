module Jellyfish
  module Fog
    module AWS
      class DatabaseProductType
        DESCRIPTION = 'Databases'.freeze
        PRODUCT_CLASS = DatabaseProduct
        PRODUCT_QUESTIONS = File.read(Jellyfish::Fog::AWS::Engine.root.join(*%w(config order_item_questions database.json))).freeze

        def self.to_json
          Jbuilder.new do |product_type|
            product_type.name 'Database Product Type'
            product_type.description 'An AWS database product provisioned with Fog'
            product_type.questions_form_schema JSON.parse(PRODUCT_QUESTIONS)
          end.target!
        end
      end
    end
  end
end
