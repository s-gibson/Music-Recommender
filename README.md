# edsp17proj-s-gibson
edsp17proj-s-gibson created by GitHub Classroom

The goal of this project is to create a music recommendation program that recommends music to users based on their past listening history and its similarities to other users' listening history.
<<<<<<< HEAD
=======

As of now, the recommendation engine is a "user-based collaborative filtering" recommender.  My goal is to implement other recommending techniques and create a "hybrid" recommendation model that relies on multiple input streams to make recommendations.

Repository organization:
* Functions: Contains R files with user-defined functions that are to be utilized in the recommendation model.
* Interactive: Contains a master input file that allows users to create a "hypothetical" listening history in order to test the recommendation engine.  Users can fill out "input_master.csv" with a list of artists they listen to and how many times they might listen to said artists.  Users can then view their recommended artists by running "Interactive recommender.Rmd" and modifying the code to match their input .csv.
* large-rep: This folder holds the large data files that are used in my repository.  "Lastfm_data.RData" is the base data environment that I use in my repository.  Some of the recommendation programs take awhile to run, so it is sometimes beneficial for me to save program-modified data environments separately for quick loading in the future.

Recent progress:
Most recently I have written code for scraping artist "tags" from the last.fm API.  I think this will be very useful moving forward as I try to develop a "hybrid" recommendation model.  The UBCF model has provided results that I am optimistic about, but ideally I could curate UBCF recommendations based on tag/genre-based recommendations.
>>>>>>> bf639ff629d7fca964318d5c6113b7e28d09588b
