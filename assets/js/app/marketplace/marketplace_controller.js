'use strict';

var _ = require('lodash');

/**@ngInject*/
function MarketplaceController(products, categories) {

  this.categories = categories;
  // Only display non deleted products.
  this.products = _.filter(products, function(product) {
    return product.deleted_at === null;
  });

  _.each(this.categories, _.bind(function(category) {
    category.products = _.filter(this.products, function(product) {
      return product.product_type_id == category.id;
    });
  }, this));
}

/**
 * @todo categories, products are used in product admin as well, could be
 *       combined better in the future.
 */
MarketplaceController.resolve = {
  ///**@ngInject*/
  //categories: function(ProductTypeResource) {
  //  return ProductTypeResource.query({"includes[]": ["questions"]}).$promise;
  //},
  ///**@ngInject*/
  //products: function(ProductResource) {
  //  return ProductResource.query({"includes[]": ["cloud", "answers"]}).$promise;
  //}
};

module.exports = MarketplaceController;
