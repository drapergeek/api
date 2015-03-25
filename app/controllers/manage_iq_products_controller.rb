class ManageIqProductsController < ApplicationController
  after_action :verify_authorized
  after_action :post_hook

  before_action :pre_hook
  before_action :load_manage_iq_product_params, only: [:create, :update]
  before_action :load_manage_iq_product, only: [:update]

  PRODUCT_PRICE_REGEX = /\d{1,6}(\.\d{0,4})?/

  api :POST, '/products', 'Creates product'
  param :name, String, desc: 'Product Name'
  param :description, String, desc: 'Short description'
  param :service_catalog_id, Integer, desc: 'ManageIQ Catalog Id'
  param :service_type_id, Integer, desc: 'ManageIQ Catalog Item Id'
  param :chef_role, String, desc: 'Chef role'
  param :product_type_id, Integer, desc: 'ProductType Id'
  param :cloud_id, Integer, desc: 'Cloud Id'
  param :options, Array, desc: 'Options', allow_nil: true
  param :hourly_price, PRODUCT_PRICE_REGEX, required: false, desc: 'Cost per Hour'
  param :monthly_price, PRODUCT_PRICE_REGEX, required: false, desc: 'Cost per Month'
  param :setup_price, PRODUCT_PRICE_REGEX, required: false, desc: 'Initial Setup Fee'
  error code: 422, desc: ParameterValidation::Messages.missing

  def create
    @manage_iq_product = ManageIqProduct.new(@manage_iq_products_params)
    @manage_iq_product.product = Product.new(@products_params)
    authorize @manage_iq_product
    @manage_iq_product.save
    ap @products_params
    ap @manage_iq_product.product
    respond_with @manage_iq_product
  end

  api :PUT, '/products/:id', 'Updates product with :id'
  param :id, :number, required: true
  param :name, String, desc: 'Product Name'
  param :description, String, desc: 'Short description'
  param :service_catalog_id, Integer, desc: 'ManageIQ Catalog Id'
  param :service_type_id, Integer, desc: 'ManageIQ Catalog Item Id'
  param :chef_role, String, desc: 'Chef role'
  param :product_type_id, Integer, desc: 'ProductType Id'
  param :cloud_id, Integer, desc: 'Cloud Id'
  param :active, :bool, desc: 'Product is active and available in the marketplace'
  param :options, Array, desc: 'options', allow_nil: true
  param :hourly_price, PRODUCT_PRICE_REGEX, required: false, desc: 'Cost per Hour'
  param :monthly_price, PRODUCT_PRICE_REGEX, required: false, desc: 'Cost per Month'
  param :setup_price, PRODUCT_PRICE_REGEX, required: false, desc: 'Initial Setup Fee'
  error code: 404, desc: MissingRecordDetection::Messages.not_found
  error code: 422, desc: ParameterValidation::Messages.missing

  def update
    authorize @manage_iq_product
    @manage_iq_product.update_attributes(@manage_iq_products_params)
    @manage_iq_product.product.update_attributes(@products_params)
    respond_with @manage_iq_product
  end

  private

  def load_manage_iq_product_params
    normalized_params = ActionController::Parameters.new

    params.dup.each do |key, value|
      Rack::Utils.normalize_params(normalized_params, key, value)
    end

    @manage_iq_products_params = normalized_params.permit(
      :service_type_id,
      :service_catalog_id,
      :chef_role,
      :cloud_id,
      options: [],
    )

    @products_params = normalized_params.permit(
      :name,
      :description,
      :img,
      :active,
      :hourly_price,
      :monthly_price,
      :setup_price,
    )

    @products_params[:provisioning_answers] = normalized_params['provisioning_answers']
  end

  def load_manage_iq_product
    @manage_iq_product = ManageIqProduct.find(params.require(:id))
  end
end
