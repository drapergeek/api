# == Schema Information
#
# Table name: product_types
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  description           :text
#  created_at            :datetime
#  updated_at            :datetime
#  questions_form_schema :json
#

class ProductType < ActiveRecord::Base
  has_many :products
  has_many :questions, -> { order 'load_order ASC' }, class_name: 'ProductTypeQuestion'

  def to_json
    {
      name: name,
      description: description,
      formSchema: questions_form_schema
    }
    # Jbuilder.new do |product_type|
    #   product_type.name name
    #   product_type.description description
    #   product_type.questions_form_schema questions_form_schema
    # end.target!
  end
end
