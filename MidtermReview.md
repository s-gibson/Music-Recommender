# Midterm Presentation Review by Suxi Zheng
## My review score for your project: Green line
### 
The goal of your project is to recommend music to users based on their past listening history.

Your method is to identify users with similar listening preferences and based on the preferences of “neighboring” users recommends new music to the test user.

The dataset is publicly available from Last.fm Playcounts but the problem is that they are quite huge. Based on your description, we can see that you have obtained the total number of user-artist combinations, number of unique users and number of unique artists.

The recommendation methodology you are going to use is collaborative filtering recommendation, which seems to be a more advanced algorithm relying on a combination of content-based.

The flow chart for explaining the collaborative filtering process is clear: use the raw data and create a utility matrix and then split them into a training set and a test set and finally obtain the resc list.
But for me, it is not that clear that what exactly the training set and test set are. 

You are going to find the users with most similar musical preferences by finding users with smallest distance from a user and the core function you are going to use is Cosine Distance in your simulation. The challenge is that the dataset is quite big so you have used a small-scale dataset for pretest at first, trading accuracy of efficiency.

The problem you have met is about how to transform the listening history to the recommendation in the model. Therefore, you need to take careful consideration about the recommendation strategy you are going to use for your model. 

In my understanding, your next steps are quite clear. First, you need to evaluate the recommendations since it is the key for your models. Then, to experiment with different user-similarity measures and generally increase the size of training utility matrix. 
The progress for the content-based recommendation is that you have been able to scrape tags associated with each artist from Last.fm’s API.  

Some concerns we talk about on class: 
* How to combine the tags together? Some genres can be quite similar but with slight tags on them and how can you combine them together?
* When it comes to sub setting, You need to fully consider about sub setting the artists because the system is believed to get better if more users are involved but it doesn’t necessarily get better with more artists involved because it could tend to be more sparse, therefore, you may focus more on dealing with the artists.

Music is necessary for our life and I rely on music very much. Hope your model could succeed and finally recommend something for us!
