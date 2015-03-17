module Jellyfish
  module Fog
    module AWS
      class InfrastructureProduct < ActiveRecord::Base
        ORDER_QUESTIONS = File.read(Jellyfish::Fog::AWS::Engine.root.join(*%w(config order_item_questions infrastructure.json))).freeze

        def provisioner
          Jellyfish::Fog::AWS::Infrastructure
        end
      end
    end
  end
end
