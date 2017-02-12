####################################################################################
####################################################################################
# Import Last.fm data.  Variables: unique user ID, artist ID, artist NAME, # of plays
Lastfm <- read_delim("~/Documents/NYU/APSTA 2017/EDSP/lastfm-dataset-360K/usersha1-artmbid-artname-plays.tsv", 
                    "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
colnames(Lastfm) <- c("usersha1","artmbid","artname","plays")
uniq.users <- unique(Lastfm$usersha1)
uniq.artist <- unique(Lastfm$artname)

####################################################################################
####################################################################################
# Save R environment
save.image("~/Documents/NYU/APSTA 2017/EDSP_v2/large data/Lastfm_data.RData")

####################################################################################
####################################################################################
# Load R environment
load("~/Documents/NYU/APSTA 2017/EDSP_v2/large data/Lastfm_data.RData")

# Keep only rows (unique user-artist combination) with > 50 plays.  Removes 24.3% of data
Lastfm <- Lastfm[which(Lastfm$plays > 50),]

# Create dataframe of total play count for ($Total.plays) and number of unique users who have 
# listened to ($N.users) each unique artist
Artist.plays <- data.frame(Artist = uniq.artist,
                           Total.plays = NA,
                           N.users = NA)
for(i in 1:length(Artist.plays$Artist)) {
  dat <- Lastfm[which(Lastfm$artname == Artist.plays$Artist[i]),]
  Artist.plays$Total.plays[i] <- sum(dat$plays)
  Artist.plays$N.users[i] <- nrow(dat)
}
rm(dat,i)

# Create dataframe of total play count ($Total.plays) and number of unique artists ($N.artists) 
# of each unique user
User.plays <- data.frame(User = uniq.users,
                         Total.plays = NA,
                         N.artists = NA)
for(i in 1:length(User.plays$User)) {
  dat <- Lastfm[which(Lastfm$usersha1 == User.plays$User[i]),]
  User.plays$Total.plays[i] <- sum(dat$plays)
  User.plays$N.artists[i] <- nrow(dat[which(dat$usersha1 == User.plays$User[i]),])
}
rm(dat,i)

##### DISTRIBUTIONS #####
# Plays for each user-artist combination
plot(density(Lastfm$plays))
# Total plays by artist
plot(density(Artist.plays$Total.plays), main = "Total Plays by Artist")
# Number of users by artist
plot(density(Artist.plays$N.users), main = "Number of Users by Artist")
# Total plays by user
plot(density(User.plays$Total.plays), main = "Total Plays by User")
# Number of artists by user
plot(density(User.plays$N.artists), main = "Number of Artists by User")
