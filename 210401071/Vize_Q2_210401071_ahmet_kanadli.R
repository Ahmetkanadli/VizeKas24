spotify_search_artist <- function(artist_name) {
  if(!is.character(artist_name)) stop("Artist name must be character type.");
  
  token <- spotify_token()
  search_url <- paste0(
    "https://api.spotify.com/v1/search?q=", URLencode(artist_name),
    "&type=artist&limit=",10
  )
  
  response <- httr::GET(
    url = search_url,
    add_headers("Authorization" = token[[2]])
  )
  
  search_result <- httr::content(response, type = "application/json")
  status_code <- status_code(response)
  
  artists <- search_result$artists$items[seq_len(5)]
  
  search_results <- data.frame(
    artist = sapply(artists, function(x) x$name),
    id = sapply(artists, function(x) x$id)
  )
  
  result <- list(
    status_code = status_code,
    search_results = search_results
  )
  
  return(result)
}

# Fonksiyonu çağırma
result <- spotify_search_artist("The Doors")
print(result$search_results)