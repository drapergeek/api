'use strict';

var ProductsData = require('./products_admin_controller').resolve,
    ProductsListData = require('./list_products_controller').resolve,
    ProductEditData = require('./edit_product_controller').resolve,
    ProductCreateData = require('./create_product_controller').resolve;

/**@ngInject*/
module.exports = function($stateProvider) {
  $stateProvider
    .state('base.authed.admin.products', {
      url: '/products',
      abstract: true,
      template: '<div class="products-admin" ui-view></div>',
      controller: 'ProductsAdminController as productsAdminCtrl',
      resolve: ProductsData
    }).state('base.authed.admin.products.list', {
      url: '/list',
      templateUrl: '/partials/admin/products/list_products.html',
      controller: 'ListProductsController as listCtrl',
      resolve: ProductsListData
    }).state('base.authed.admin.products.edit', {
      url: '/edit/{id:int}',
      templateUrl: '/partials/admin/products/edit_product.html',
      controller: 'EditProductController as editCtrl',
      resolve: ProductEditData
    }).state('base.authed.admin.products.create', {
      url: '/create?{product_type_id:int}',
      templateUrl: '/partials/admin/products/create_product.html',
      controller: 'CreateProductController as createCtrl',
      resolve: ProductCreateData
    });
};

