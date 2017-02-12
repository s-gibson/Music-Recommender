# This R script is intended to test music suggestion methods using only a small subset of the
# full dataset.
####################################################################################
####################################################################################
# Save LastFM simulation data
save.image("~/Documents/NYU/APSTA 2017/EDSP/Lastfm_sim_data.RData")

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
samp.Utility <- matrix(data = NA, nrow = length(unique(samp.dat$artname)), ncol = length(
  unique(samp.dat$usersha1)))
colnames(samp.Utility) <- unique(samp.dat$usersha1)
rownames(samp.Utility) <- unique(samp.dat$artname)

# fill in utility matrix
for (c in 1:ncol(samp.Utility)) {
  for (r in 1:nrow(samp.Utility)) {
    samp.Utility[r,c] <- max(samp.dat$plays[
      which(samp.dat$artname == rownames(samp.Utility)[r] &
              samp.dat$usersha1 == colnames(samp.Utility)[c])
    ], 0)
  }
}

