@IndexCtrl = ["$scope", "$http", ($scope, $http)->

  $scope.movieList = null
  $scope.bigDisplay = null
  $scope.submitInput = (movie) ->

    $http(method: "GET", url: "http://www.omdbapi.com/", params: {s: movie}

    ).success((data, status, headers, config) ->
      $scope.movieList = data.Search
      # console.log "This is printing:", $scope.movieList
    ).error (data, status, headers, config) ->
      # console.log "error mayneee"



  $scope.movieInfoGet = (movie) ->
    index = $scope.movieList.indexOf(movie)
    $http(method: "GET", url: "http://www.omdbapi.com/", params: {t: movie.Title}

    ).success((data, status, headers, config) ->
      $scope.movieList[index].Details = data

    ).error (data, status, headers, config) ->
      console.log "error "

  $scope.bigDisplayGet = (movie) ->

    $http(method: "GET", url: "http://www.omdbapi.com/", params: {t: movie.Title}

    ).success((data, status, headers, config) ->
      $scope.bigDisplay = data
      console.log "bigDisplay:", data
    ).error (data, status, headers, config) ->
      console.log "error mayneee"
]
