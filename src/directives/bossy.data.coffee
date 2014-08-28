angular.module("app.factory.bossy.data", []).factory "$data", ->
  _getData = (data) ->
    if angular.isString(data)
      _getRemoteData data
    else if angular.isObject(data)
      data
    else
      #TODO: replace error message with online doc link like ng errors
      console.error "directive.bossyForm: no data url or object given"

  _getRemoteData = ($q) ->
    deferred = $q.defer()

    #TODO: replace error message with online doc link like ng errors
    $http.get(data).success((data) ->
      if angular.isObject(data)
        deferred.resolve data
      else
        deferred.reject "directive.bossyForm: GET request to url did not produce data object"

    ).error (response_data, status) ->

      #TODO: replace error message with online doc link like ng errors
      deferred.reject "directive.bossyForm: GET request to url \"" + data + "\" failed with status \"" + status + "\""

    deferred.promise
  getData: _getData

