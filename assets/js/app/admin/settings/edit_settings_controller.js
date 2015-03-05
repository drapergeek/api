'use strict';

/**@ngInject*/
function EditSettingsController($scope, settings, FlashesService) {
  $scope.settings = settings;
  $scope.updating = false;
  $scope.updateSetting = function(setting) {
    $scope.updating = true;
    setting.$update(function() {
      $scope.updating = false;
    }, function() {
      $scope.updating = false;
      FlashesService.add({
        timeout: true,
        type: 'error',
        message: "There was an error updating this setting. Please try again."
      });
    });
  };
}

EditSettingsController.resolve = {
  /**@ngInject*/
  settings: function(SettingsResource) {
    return SettingsResource.query().$promise;
  }
};

module.exports = EditSettingsController;
