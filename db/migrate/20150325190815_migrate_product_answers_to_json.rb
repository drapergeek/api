class MigrateProductAnswersToJson < ActiveRecord::Migration
  class Product < ActiveRecord::Base
    has_many :product_answers
  end

  class ProductAnswer < ActiveRecord::Base
    belongs_to :product_type_question
  end

  class ProductTypeQuestion < ActiveRecord::Base
  end

  def change
    Product.reset_column_information
    ProductAnswer.reset_column_information
    ProductTypeQuestion.reset_column_information

    Product.all.each do |product|
      answers = {}

      product.product_answers.each do |answer|
        answers[answer.product_type_question.manageiq_key] = answer.answer
      end

      product.provisioning_answers = answers
      product.save!
    end
  end
end
