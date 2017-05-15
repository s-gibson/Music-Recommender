# edsp17proj-s-gibson
edsp17proj-s-gibson created by GitHub Classroom

The goal of this project is to create a music recommendation program that recommends music to users based on their past listening history and its similarities to other users' listening history as well as the similarity of artists that a user listens to.

I haven't completed a fully functional program that offers recommendations through a combination of user similarity and artist similarity, but I do have working programs that offer "recommendations" separately.  A next step would be to aggregate these recommendation programs into a single algorithm.

Repository organization:
* large-rep: This folder holds the large data files that are used in my repository.  "Lastfm_data.RData" is the base data environment that I use in my repository.  Some of the recommendation programs take awhile to run, so it is sometimes beneficial for me to save program-modified data environments separately for quick loading in the future.  "Interactive.RData" is used in the "Interactive recommender.Rmd" program, "Artist similarity.RData" is used in the "Artist Similarity.Rmd".
* Interactive.Rmd: This program is an interactive recommendation program that people viewing this repository can use to generate personal recommendations for themselves by inputting a hypothetical listening history for which to recommend through user-based collaborative filtering.
* Artist Similarity.Rmd: This program allows people viewing this repository to explore artists similar to their favorite artists through cosine distance similarity.  The program generates a list of the top 10 most similar artists, and also produces a venn diagram visualization of the artist of interest, the artist's top two most similar artists, and the overlap of listeners of the targets artist and the two similar artists.
