'use strict';

angular.module('broker', [
  "ui.router",
  "ngResource",
  "angular-loading-bar",
  "smart-table",
  'ngAnimate',
  "ui.gravatar",
  "angucomplete",
  "ui.bootstrap",
  "ui.select",
  "fiestah.money",
  "ngCookies",
  "angular-progress-arc",
  require('./common').name,
  require('./base').name,
  require('./errors').name,
  require('./admin').name,
  require('./alerts').name,
  require('./flashes').name,
  require('./question_input').name,
  require('./authentication').name,
  require('./cart').name,
  require('./projects').name,
  require('./products').name,
  require('./clouds').name,
  require('./services').name,
  require('./marketplace').name,
  require('./orders').name,
  require('./directives').name,
  require('./dashboard').name,
  require('./users').name,
  require('./settings').name

])
  .run(require('./init'));
