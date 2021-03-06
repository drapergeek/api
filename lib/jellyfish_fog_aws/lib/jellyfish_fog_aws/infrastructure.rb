module Jellyfish
  module Fog
    module AWS
      class Infrastructure < ::Provisioner
        def provision
          # TODO: Must get an image_id from product types
          details = order_item.answers.merge('image_id' => 'ami-acca47c4')
          server = nil

          handle_errors do
            server = connection.servers.create(details).tap { |s| s.wait_for { ready? } }
          end

          order_item.provision_status = 'ok'
          order_item.payload_response = server.to_json
        end

        def retire
          handle_errors do
            connection.servers.delete(server_identifier)
          end
          order_item.provision_status = :retired
        end

        private

        def connection
          ::Fog::Compute.new(
            provider: 'AWS',
            aws_access_key_id: aws_settings[:access_key],
            aws_secret_access_key: aws_settings[:secret_key]
          )
        end

        def server_identifier
          order_item.payload_response['id']
        end

        def handle_errors
          yield
        rescue Excon::Errors::BadRequest, Excon::Errors::Forbidden => e
          raise e, 'Bad request. Check for valid credentials and proper permissions.', e.backtrace
        end
      end
    end
  end
end
