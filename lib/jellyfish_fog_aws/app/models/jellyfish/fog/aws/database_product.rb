module Jellyfish
  module Fog
    module AWS
      class DatabaseProduct < ActiveRecord::Base
        ORDER_QUESTIONS = File.read(Jellyfish::Fog::AWS::Engine.root.join(*%w(config order_item_questions database.json))).freeze

        def provisioner
          Jellyfish::Fog::AWS::Databases
        end
      end
    end
  end
end
