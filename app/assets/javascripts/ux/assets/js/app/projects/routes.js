'use strict';
var NewProjectData = require('./new_project_controller').resolve;
var ProjectData = require('./project_controller').resolve;
var EditProjectData = require('./edit_project_controller').resolve;
var ProjectServicesData = require('./project_services_controller').resolve;

/**@ngInject*/
module.exports = function($stateProvider) {
  $stateProvider
    // Create Project
    .state('base.authed.newProject', {
      url: "^/project/new",
      templateUrl: "/partials/projects/new_project.html",
      resolve: NewProjectData,
      controller: "NewProjectController as newProjectCtrl"
    })
    // Project Base
    .state('base.authed.project', {
      abstract: true,
      url: "^/project/:projectId",
      template: "<div ui-view></div>",
      resolve: ProjectData,
      controller: "BaseProjectController as baseProjectCtrl"
    })
    // Project
    .state('base.authed.project.view', {
      url: "^/project/:projectId",
      templateUrl: "/partials/projects/project.html",
      controller: "ProjectController as projectCtrl"
    })
    // Edit Project
    // @todo This should extend the base.project state if possible.
    .state('base.authed.project.edit', {
      url: "^/project/:projectId/edit",
      templateUrl: "/partials/projects/edit_project.html",
      resolve: EditProjectData,
      controller: "EditProjectController as editProjectCtrl"
    })
    // Add Service to Project
    .state('base.authed.project.addService', {
      url: "^/project/:projectId/add-service",
      templateUrl: '/partials/projects/add_services.html',
      controller: 'ProjectServicesController as projectServicesCtrl',
      resolve: ProjectServicesData
    })
    // Add User to Project
    .state('base.authed.project.view.addUser', {
      url: "^/project/:projectId/add-user",
      /**@ngInject**/
      onEnter: function($stateParams, $state, JellyfishModal, project) {

        // When the modal is resolved or rejected we want to transition
        // back to the project page.
        var onClose = function() {
          return $state.transitionTo('base.authed.project.view', $stateParams);
        };

        JellyfishModal.open({
          id: 'add-users',
          templateUrl: '/partials/projects/add_users_modal.html',
          controller: 'ProjectUsersController as projectUsersCtrl',
          /**
           * This is somewhat of a hack, because of using string based controller instantiation in the modal
           * the ui-router scope does not cascade into onEnter.  We use resolve to effectively inject the data
           * back in.
           */
          resolve: {
            project: function() {
              return project;
            }

          }
        }).result.then(onClose, onClose);
      }
    });
};
