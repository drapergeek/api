class AwsFog
  def initialize
    aws_setting = Setting.where(name: 'AWS').first
    aws_setting_field = SettingField.where(setting_id: aws_setting.id).order(load_order: :asc).as_json
    Fog.mock! if ENV['MOCK_MODE'] == 'true'
    @aws_connection = Fog::Compute.new(
      provider: 'AWS',
      aws_access_key_id: aws_setting_field[1]['value'],
      aws_secret_access_key: aws_setting_field[2]['value']
    )
  end

  def provision(order_item)
    @order_item = order_item
    product_type = order_item.product.product_type.name.capitalize.downcase
    method_call = method("provision_#{product_type}")
    method_call.call
  end

  def provision_infrastructure
    answers = @order_item.product.answers
    details = {}
    # TODO: Change ProductType structure so that the key needed
    # is the product type for each hash needed for product creation
    answers.each do |answer|
      question = ProductTypeQuestion.where(id: answer.product_type_question_id).first.manageiq_key
      details[question] = answer.answer
    end
    # TODO: Must get an image_id from product types
    details['image_id'] = ''
    begin
      server = @aws_connection.servers.create(details)
      # Waiting for it to boot
      server.wait_for { ready? }
    rescue StandardError => e
      Delayed::Worker.logger.debug "Caught standard error #{e.message}"
      @order_item.provision_status = 'critical'
      @order_item.message = e.message
    end
    # Store the created server information
    @order_item.ip_address = server.public_ip_address
    @order_item.provision_status = 'ok'
  end

  def provision_storage
  end

  def provision_databases
  end

  def retire_infrastructure
  end

  def retire_storage
  end

  def retire_databases
  end
end