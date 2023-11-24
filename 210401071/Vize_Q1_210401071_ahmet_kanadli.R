Sys.setenv(CLIENT_ID = "e94d967525ef4e18b1ca6e1f09d1504c", CLIENT_SECRET = "0f7bb5791aa54f7cb0eaf9fcd3663560")


# Spotify'dan client auth token almak için bir fonksiyon
spotify_token <- function() {
  # Spotify uygulamanızın client_id ve client_secret değerleri
  client_id <- Sys.getenv("CLIENT_ID")
  client_secret <- Sys.getenv("CLIENT_SECRET")
  
  # Spotify Web API'nin token endpoint'i
  token_url <- "https://accounts.spotify.com/api/token"
  
  # client_id ve client_secret'i base64 formatına dönüştürme
  auth <- paste(client_id, client_secret, sep = ":")
  auth <- base64enc::base64encode(charToRaw(auth))
  
  # HTTP POST isteği oluşturma
  response <- httr::POST(
    url = token_url,
    httr::add_headers(
      Authorization = paste("Basic", auth)
    ),
    body = list(
      grant_type = "client_credentials"
    ),
    encode = "form"
  )
  
  # Yanıtı JSON formatına dönüştürme ve access_token'i alma
  content <- httr::content(response, as = "parsed")
  access_token <- content$access_token
  
  
  status_code <- httr::status_code(response)
  
  # Token'ı alma
  token <- httr::content(response)$access_token
  
  # Çıktıyı oluşturma
  output <- list(
    status_code = status_code,
    token = paste('Bearer', token)
  )
  
  return(output)
  
}

# Fonksiyonu çağırma
spotify_token()