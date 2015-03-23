'use strict';

/**@ngInject*/
function ProjectQuestionForm() {
  return {
    restrict: 'E',
    templateUrl: '/partials/admin/projects/project_question_form.html',
    scope: {
      projectQuestion: "=",
      buttonLabel: '=',
      submitFunction: "&submitFunction"
    },
    controller: ['$scope', function($scope) {
      $scope.addOption = function() {
        $scope.projectQuestion.options.push('');
      };

      $scope.$watch('projectQuestion.field_type', function(newType, lastType) {
        if (newType != lastType && newType === 'select_option') {
          $scope.projectQuestion.options = [''];
        } else if (newType != lastType && $scope.projectQuestion.options) {
          $scope.projectQuestion.options = null;
        }
      });
    }]
  };
}

window.ProjectQuestionForm = ProjectQuestionForm;
