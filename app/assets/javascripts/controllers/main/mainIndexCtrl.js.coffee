@IndexCtrl = ["$scope", "$http", ($scope, $http)->

  $scope.movieList = null
  $scope.bigDisplay = null

  $scope.submitInput = (movie) ->

    $http(method: "GET", url: "http://www.omdbapi.com/", params: {s: movie, apikey: "5c4c1c9f"}

    ).success((data, status, headers, config) ->
      $scope.movieList = data.Search
      console.log "This is printing:", $scope.movieList
    ).error (data, status, headers, config) ->
      # console.log "error mayneee"



  $scope.movieInfoGet = (movie) ->
    index = $scope.movieList.indexOf(movie)
    $http(method: "GET", url: "http://www.omdbapi.com/", params: {t: movie.Title, apikey: "5c4c1c9f"}

    ).success((data, status, headers, config) ->
      $scope.movieList[index].Details = data

    ).error (data, status, headers, config) ->
      console.log "error "

  $scope.bigDisplayGet = (movie) ->

    $http(method: "GET", url: "http://www.omdbapi.com/",  params: {t: movie.Title, apikey: "5c4c1c9f"}

    ).success((data, status, headers, config) ->
      $scope.bigDisplay = data

    ).error (data, status, headers, config) ->
      console.log "error mayneee"

  $scope.bigPoster = (movie) ->

    $http(method: "GET", url: "http://www.omdbapi.com/",  params: {t: movie.Title}
    ).success((data, status, headers, config) ->
      console.log "running 2nd call"

      console.log data.imdbID
      $http(method: "GET", url: "http://img.omdbapi.com/",  params: {i: data.imdbID, apikey: "5c4c1c9f"}
      ).success((data, status, headers, config) ->
        console.log "this is from img call"

        console.log data

      ).error (data, status, headers, config) ->
        console.log "error mayneee"


    ).error (data, status, headers, config) ->
      console.log "error mayneee"


    # $http(method: "GET", url: "http://img.omdbapi.com/",  params: {i: @imdbid, apikey: "5c4c1c9f"}
    # ).success((data, status, headers, config) ->
    #   data


    # ).error (data, status, headers, config) ->
    #   console.log "error from pic API"


]

# Host: ia.media-imdb.com
# Connection: keep-alive
# Cache-Control: max-age=0
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36
# Accept-Encoding: gzip,deflate,sdch
# Accept-Language: en-US,en;q=0.8

