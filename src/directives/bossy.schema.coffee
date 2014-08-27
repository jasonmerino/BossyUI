angular.module("app.factory.bossy.schema", []).factory "$schema", ->
  _getSchema = (schema) ->
    if angular.isString(schema)
      _getRemoteSchema schema
    else if angular.isObject(schema)
      schema
    else
      
      #TODO: replace error message with online doc link like ng errors
      console.error "directive.bossyForm: no schema url or object given"
    return
  _getRemoteSchema = ->
    deferred = $q.defer()
    
    #TODO: replace error message with online doc link like ng errors
    $http.get(schema).success((data) ->
      if angular.isObject(data)
        deferred.resolve data
      else
        deferred.reject "directive.bossyForm: GET request to url did not produce schema object"
      return
    ).error (data, status) ->
      
      #TODO: replace error message with online doc link like ng errors
      deferred.reject "directive.bossyForm: GET request to url \"" + schema + "\" failed with status \"" + status + "\""
      return

    deferred.promise
  getSchema: _getSchema

