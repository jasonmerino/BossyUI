angular.module("app.directive.bossy.button", []).directive "bossyButton", ($compile, $http, $schema, $data, $templateCache) ->
  restrict: "E"
  replace: true
  scope:
    title: "="
    value: "="
  template: "<div class=\"form-group bossy-button\"><button class=\"form-control\">{{title}}</button><span></span></div>"