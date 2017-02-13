library(class)
library(recommenderlab)
# This R script is intended to test music suggestion methods using only a small subset of the
# full dataset.
####################################################################################
####################################################################################
# Save LastFM simulation data
save.image("~/Documents/NYU/APSTA 2017/EDSP_v2/large data/Lastfm_sim_data.RData")

####################################################################################
####################################################################################
# Load LasFM simulation data
load("~/Documents/NYU/APSTA 2017/EDSP_v2/large data/Lastfm_sim_data.RData")

####################################################################################
####################################################################################
# Plot the density of User.plays$N.artists.  This shows the how many unique artists
# users listen to.
plot(density(User.plays$N.artists, na.rm = T))
hist(User.plays$N.artists, na.rm = T)
# It looks like users listen to between 1 and 70 different artists, with the modal amount of
# unique artists listend by a user being ~50 artists.

# For our simulation, let's consider users who listen to between 20 and 50 unique artists,
# for the sake of having a good mix of arists listened to and avoiding users who have very
# narrow music preference.
User.plays.20_50 <- User.plays[which(User.plays$N.artists < 50 & User.plays$N.artists > 20),]

# Let's draw a sample of 100 users from User.plays.20_50, and create a utility matrix of
# their musical preferences.
set.seed(02122017)
N_samp <- 100
samp.users <- User.plays.20_50$User[sample(c(1:length(User.plays.20_50$User)), N_samp , replace = F)]
samp.dat <- Lastfm[which(Lastfm$usersha1 %in% samp.users),]

# Create utility matrix
samp.Utility <- matrix(data = NA, nrow = length(unique(samp.dat$usersha1)),
                       ncol = length(unique(samp.dat$artname)))
rownames(samp.Utility) <- unique(samp.dat$usersha1)
colnames(samp.Utility) <- unique(samp.dat$artname)

# fill in utility matrix for training
for (r in 1:nrow(samp.Utility)) {
  for (c in 1:ncol(samp.Utility)) {
    samp.Utility[r,c] <- max(samp.dat$plays[
      which(samp.dat$artname == colnames(samp.Utility)[c] &
              samp.dat$usersha1 == rownames(samp.Utility)[r])
    ], 0)
  }
}
rm(r,c)
samp.Utility[which(samp.Utility[,] == 0)] <- NA

# Create a utility matrix of the sampled users with binary values: 0 = user has never
# listened to artist, 1 = user has listened to artist.
samp.Utility_bin <- samp.Utility
samp.Utility_bin[!is.na(samp.Utility_bin)] <- 1
samp.Utility_bin[is.na(samp.Utility_bin)] <- 0

# Create UBCF recommendation model using samp.Utility_bin as training data.
r_test <- sample(c(1:N_samp), 1)
rownames(samp.Utility_bin)[r_test]
affinity.mat <- as(samp.Utility_bin[c((1:(r_test-1)),((r_test+1):N_samp)),],"realRatingMatrix")
Rec.model_bin <- Recommender(data = affinity.mat, method = "UBCF")
recommended.items <- predict(Rec.model_bin, as(samp.Utility_bin[r_test,],"realRatingMatrix"), 
                             n = 5)
as(recommended.items,"list")


######################################
# select random user for testing
test.User <- User.plays.20_50$User[which(!(User.plays.20_50$User %in% samp.users))][
  sample(c(1:length(User.plays.20_50$User)-N_samp),1 , replace = F)]
test.User
View(Lastfm[which(Lastfm$usersha1 == test.User),])


