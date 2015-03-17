module Jellyfish
  module Fog
    module AWS
      class StorageProduct < ActiveRecord::Base
        ORDER_QUESTIONS = File.read(Jellyfish::Fog::AWS::Engine.root.join(*%w(config order_item_questions storage.json))).freeze

        def provisioner
          Jellyfish::Fog::AWS::Storage
        end
      end
    end
  end
end
