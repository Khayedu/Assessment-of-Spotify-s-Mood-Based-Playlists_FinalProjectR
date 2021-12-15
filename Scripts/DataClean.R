# Data Wrangling ----------------------------------------------------------

# Setting up access to the Spotify Api

Sys.setenv(SPOTIFY_CLIENT_ID = "1808c94d92d94f83843e8e7bbcde89e3")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "ce03a72698f740ac9606cde1cc3f3a83")

access.token <- get_spotify_access_token()
#acc
happy <- get_playlist_audio_features("Spotify", "37i9dQZF1DXdPec7aLTmlC")
sad <- get_playlist_audio_features("Spotify", "37i9dQZF1DWSqBruwoIXkA")
calm <- get_playlist_audio_features("Spotify", "37i9dQZF1DWTC99MCpbjP8")
energy <- get_playlist_audio_features("Spotify", "37i9dQZF1DX0vHZ8elq0UK")

hap.s <- happy %>% 
  select(track.name, instrumentalness, 
    danceability, acousticness, 
    energy, tempo, speechiness, valence)

hap.s <- add_column(hap.s, "Happy")
names(hap.s)[9] <- "Playlist"


sad.s <- sad %>% 
  select(track.name, instrumentalness, 
         danceability, acousticness, 
         energy, tempo, speechiness, valence)

sad.s <- add_column(sad.s, "Sad")
names(sad.s)[9] <- "Playlist"


cal.s <- calm %>% 
  select(track.name, instrumentalness, 
         danceability, acousticness, 
         energy, tempo, speechiness, valence)

cal.s <- add_column(cal.s, "Calm")
names(cal.s)[9] <- "Playlist"


ene.s <- energy %>% 
  select(track.name, instrumentalness, 
         danceability, acousticness, 
         energy, tempo, speechiness, valence)

ene.s <- add_column(ene.s, "Energy")
names(ene.s)[9] <- "Playlist"


fulllist <- rbind(hap.s, sad.s, cal.s, ene.s)

write.csv(fulllist, "Data - Clean/fulllist.csv")


# -------------------------------------------------------------------------


