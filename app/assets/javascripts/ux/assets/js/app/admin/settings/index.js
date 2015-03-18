'use strict';

var angular = require('angular');

var AdminSettingsModule = angular.module('broker.admin.settings', [])
  .controller('EditSettingsController', require('./edit_settings_controller'))
  .controller('SettingsController', require('./settings_controller'))
  .config(require('./routes'));

module.exports = AdminSettingsModule;
