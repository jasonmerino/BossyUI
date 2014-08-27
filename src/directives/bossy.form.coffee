angular.module("app.directive.bossy.form", []).run(($templateCache) ->
  $templateCache.put "bossy-input.html", "templates/bossy-input.html"
  return
).directive "bossyForm", ($compile, $http, $schema, $data) ->
  setData = (data) ->
    _data = $data.getData(data)
    return
  setSchema = (schema) ->
    _schema = $schema.getSchema(schema)
    return
  buildTemplate = (schemaPart, parentKey, required) ->
    template = ""
    fullKey = ""
    angular.forEach schemaPart, ((value, key) ->
      if value.type
        console.log fullKey + " is " + value.type
        switch value.type
          when "object"
            required_list = (if typeof (value.required) isnt "undefined" then value.required else null)
            template += buildTemplate(value.properties, fullKey, required_list)
          when "array"
            template += buildTemplate(value.items.properties, fullKey)
          when "number" or "integer"
            template += _itemTemplate.number(value)
          when "string"
            is_required = false
            is_required = true  if required and required.indexOf(key) isnt -1
            template += _itemTemplate.text(value, key, is_required)
          when "boolean"
            template += _itemTemplate.checkbox(value)
    ), this
    template
  _schema = undefined
  _data = undefined
  _itemTemplate =
    number: ->
      "<input type=\"number\"/>"

    text: (obj, key, is_required) ->
      "<bossy-input title=\"'" + obj.title + "'\" value=\"'" + _data.address[key] + "'\"" + ((if is_required then " required" else "")) + "></bossy-input>"

    textArea: ->
      "<textarea></textarea>"

    checkbox: (obj) ->
      "<div class=\"checkbox\"><label><input type=\"checkbox\">" + obj.title + "</label></div>"

  restrict: "E"
  replace: true
  template: ""
  scope:
    options: "=" #Create scope isolation with bi-directional binding,
    title: "="

  link: (scope, element, attributes) ->
    setData scope.options.data
    setSchema scope.options.schema
    element.html "<form style=\"width: 40%; margin:0 auto\" novalidate>" + "<h4 class=\"text-center text-uppercase well\">{{title}}</h4>" + buildTemplate(_schema) + "</form>"
    $compile(element.contents()) scope
    return

