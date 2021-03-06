module Jellyfish
  module Fog
    module AWS
      class Databases < ::Provisioner
        def provision
          @password = SecureRandom.hex(5)
          db_instance_id = "id-#{order_item.uuid[0..9]}"
          begin
            db = connection.create_db_instance(db_instance_id, details)
          rescue Excon::Errors::BadRequest, Excon::Errors::Forbidden => e
            raise e, 'Bad request. Check for valid credentials and proper permissions.', e.backtrace
          end

          order_item.instance_name = db_instance_id
          order_item.password = ::BCrypt::Password.create(@password)
          order_item.port = db.local_port
          order_item.public_ip = db.remote_ip
          order_item.url = db.local_address
          order_item.payload_response = db.to_json
          order_item.provision_status = 'ok'
          order_item.username = 'admin'
        end

        def retire
          connection.delete_db_instance(identifier, snapshot, false)
          order_item.provision_status = :retired
        rescue Excon::Errors::BadRequest, Excon::Errors::Forbidden => e
          raise e, 'Bad request. Check for valid credentials and proper permissions.', e.backtrace
        end

        private

        def details
          order_item.answers.merge(
            'MasterUserPassword' => @password,
            'MasterUsername' => 'admin'
          )
        end

        def connection
          ::Fog::AWS::RDS.new(
            aws_access_key_id: aws_settings[:access_key],
            aws_secret_access_key: aws_settings[:secret_key]
          )
        end

        def identifier
          order_item.payload_response['data']['body']['CreateDBInstanceResult']['DBInstance']['DBInstanceIdentifier']
        end

        def snapshot
          "snapshot-#{order_item.uuid[0..5]}"
        end
      end
    end
  end
end
