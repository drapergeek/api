##jellyfish-ux
============

[![Code Climate](https://codeclimate.com/github/projectjellyfish/ux/badges/gpa.svg)](https://codeclimate.com/github/projectjellyfish/ux)
[![Test Coverage](https://codeclimate.com/github/projectjellyfish/ux/badges/coverage.svg)](https://codeclimate.com/github/projectjellyfish/ux)
[![Build Status](https://travis-ci.org/projectjellyfish/ux.svg?branch=master)](https://travis-ci.org/projectjellyfish/ux)

Jellyfish-UX is the UI layer of Project Jellyfish.

####Overview

Project Jellyfish is an IT broker system.  It allows admins to create a product catalog of any type of service (IaaS,
TaaS, PaaS, or even Staff) and allows them to be assigned a cost, and then users can create projects and add those
services to a project.  Jellyfish current supports IaaS via [ManageIQ](http://manageiq.org) and [Chef](http://www.chef.io).

Project Jellyfish has 2 main components: API and UX.  UX is the HTML5 User Interface for Project Jellyfish.  It is an
AngularJS / NodeJS application that provides an HTML5 front-end to Jellyfish-Core for users to purchase services, and
for admins to add new products and services; and for end-users to sign-up for services.

####Installation

Jellyfish-UX is a Node/ExpressJS application.

Please use the OS specific install guide from below.

- INSTALL-RHEL.md - Red Hat Enterprise Linux installation
- INSTALL-MACOSX.md - Mac OS X installation
- INSTALL-WINDOWS7.md - Windows 7 installation

####Adding product icons

To add new product icons, put the 60x60px images in images/assets/images/products/ then update
/assets/js/app/admin/products/products_admin_controller.js

####License

See LICENSE

Copyright 2015 Booz Allen Hamilton
