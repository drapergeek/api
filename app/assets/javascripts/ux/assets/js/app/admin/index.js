'use strict';

var AdminModule = angular.module('broker.admin', [
  'broker.products',
  'broker.projects',
  'broker.users',
  'broker.settings'
])
.controller('AdminController'
  require('./products').name,
  require('./projects').name,
  require('./users').name,
  require('./settings').name])
  .controller('AdminController', AdminController)
  .config(require('./routes'));

window.AdminModule = AdminModule;
