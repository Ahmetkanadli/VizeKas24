token_result <- spotify_token() 
print(token_result)

search_results <- spotify_search_artist("The Doors")
print(search_results)

my_artist_list <- c("The Door", "The Weekend", "Sezen Aksu", "Barış Manço", "İbrahim Tatlıses") # Gerçek sanatçı isimlerini ekleyin
my_artists <- data.frame(artist = my_artist_list, id = character(length(my_artist_list)), stringsAsFactors = FALSE)

for (i in 1:nrow(my_artists)) {
  artist_name <- my_artists[i, "artist"]
  search_result <- spotify_search_artist(artist_name)
  id <- search_result$search_results$id[1] 
  my_artists[i, "id"] <- id
}

print(my_artists)