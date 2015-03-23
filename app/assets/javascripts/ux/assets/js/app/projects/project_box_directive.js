'use strict';

/**@ngInject*/
var ProjectBoxDirective = function() {
  return {
    restrict: 'E',
    templateUrl: '/partials/projects/project_box.html',
    transclude: true,
    scope: {
      project: "="
    },
    link: function($scope) {
      $scope.sref = 'base.authed.project.view(' + angular.toJson({projectId: $scope.project.id}) + ")";
    }
  };
};

window.ProjectBoxDirective = ProjectBoxDirective;
