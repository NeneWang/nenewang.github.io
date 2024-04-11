
course dataset repository: https://raw.githubusercontent.com/CUNY-CISC-3225/datasets/main/
bike_rentals.csv. This version has been edited to remove unnecessary columns and has altered some
values to make preprocessing easier.
The dataset contains data from 2 years of bicycle rental data. Each row represents an hour of a day, and
contains several attributes about the rental time including the season, weather, and what kind of day it is
(working day and holiday). It also contains a “count” column, which indicates the number of bikes rented
over the hour.
Note that the “temp” column contains the actual temperature in Celsius, and “atemp” contains an
estimate of the sensation of temperature in Celsius.


### 1 Analysis 
Perform a basic exploratory analysis of the dataset. The goal of this analysis should be to identify whether
each column is continuous or categorical.
1. Are there any missing values?
> No

2. Regardless of your answer above, would missing values be a problem for clustering? Why or why not?
> Missing values would be a problem for clustering because when it comes to categorizing and creating the different clusters, the missing values would impact on the mean calculations of the clusters. Incorrectly assigning data points.


3. Which columns contain continuous values? For these columns, use describe() to show basic summary
statistics about them.

Floating Continuous values are:

> temp, atemp, windspeed.

Integer Continuous values are:
Year, Hour, humidity, Count


4. Which columns contain categorical values? Use value counts() to show the unique values contained
in each column, and how often they appear.


5. Of the categorical columns, which contain binary yes/no values? What do the yes/no values mean?

> holiday (yes: True, no: False) and workingday (0: False/1: True).
> true | False: Means if it is a holiday or not.
> 1 | 0: Means if it is a working day or not.

### 2 Preprocessing (6 points)
Perform any steps necessary to preprocess the dataset to prepare it for clustering. This could include one-hot
encoding, producing binary 0/1 values, or standardizing with Z-score normalization.


#### 3 K=2 (8 points)
Perform K-means clustering with K=2 (3 points). Answer the following questions:


6. (1 point) How many different rental periods are represented in each cluster?

> Rentai perdios in Cluster 1 (0): 17 Hours
> Rental periods in Cluster 2 (1): 24 Hours

7. (4 points) Using averaged columns within each cluster, give a profile of a low-count rental period and a high-count rental period. Why do you think fewer people are renting bikes in the low-count rental period?

> Given the profiles, the low-count pental period seems to be located at Cluster 1. With an average of rental count of 99. While on cluster 0 seems to posses a mean count of 437

Significant Differences from Categorical Columns:

|                | Cluster 0 | Cluster 1 | Inisghts                                                    |
| -------------- | --------- | --------- | ----------------------------------------------------------- |
| Mean Count     | 437       | 99        | Cluster 0, (yellow) has a higher count of rentals.          |
| weather_bad    | 0.03      | 0.09      | Bad weather seems to associate with low rentals.            |
| season_winter  | 0.09      | 0.3       | Winter season seems to associate with low rentals.          |
| seasons summer | 0.34      | 0.21      | Summer season seems to somehow associate with high rentals. |
| Season Spring  | 0.3       | 0.22      | Spring season seems to associate with high rentals.         |

What surprised me::
- In autum, there is almost no difference
- working day and holiday seems to have almost no impact on the rental count.

For Continuous Data differences can be seen in: 

- temp
- humidity
- aTemp
- windspeed
- hour


Why do you think fewer people are renting bikes in the low-count rental period?

By plotting in a scatter plot, we can see interestingly that there is a range of prefered continous values.
- Seems that more rentings appear during the time range: 7-21
- More rentings during the mid ranging temperatures and humidity
  - Temperature ranging 10-35
  - Humidity ranging 20-80
- For Humidity and Temperature ranges, it could ALSO be that extreme humidity and temperatures are also less frequent in nature, thus less recordings appear.
- Less Windspeed seems to associate with more rentals.
  - Ranging 0-30 mainly while extreme values are not prefered.




**Reasons why they rent less during those parameters:**

- Temperature & Seasons: Extreme temperatures are not prefered. And this are associated. This also shows whereas: Spring and Summer are prefered. While Winter not, and autum doesn't seem to have a significant impact. Might make sense as colder temperatures, might make cycling less confortable, perhaps more dangerous as roads might be frozen.
- Humidity Mid ranging humidity seems to be prefered. While extreme values are not. Makes sense for people to prefer milder levels of Humidity.
- Windspeed: Less windspeed seems to associate with more rentals. While extreme values are not prefered. Too much wind might make cycling less confortable, and more dangerous as well.


### 4 K=3 (10 points)
Perform K-means clustering with K=3 (3 points). Answer the following questions:



8. (1 point) How many different rental periods are represented in each cluster?

| Cluster | Periods |
| ------- | ------- |
| 0       | 14      |
| 1       | 24      |
| 22      | 20      |

9.  (4 points) Using averaged columns within each cluster, give a profile of a low-count rental period and
a high-count rental period. Why do you think fewer people are renting bikes in the low-count rental
period?


|               | Cluster 0 (High) | Cluster 1 (Low) | Cluster 2 (mid+) | Insights                                                  |
| ------------- | ---------------- | --------------- | ---------------- | --------------------------------------------------------- |
| Mean Count    | 566              | 59              | 263              | I would consider 0 and 2 as high rentals                  |
| Season Summer | 0.366914         | 0.201020        | 0.292729         | Summer seems to associate with high rentals.              |
| Season Winter | 0.076352         | 0.345229        | 0.154930         | Winter seems to associate with low rentals significantly. |


**No significant difference**

- Season Autum
- Weather good
- Weather moderate
- Holiday Not
- Holiday yes


**Continuous to look at**

- Hour
- Temp
- aTemp
- Humidity
- Windspeed


> Based on the analysis it seems to capture a very similar image from the last question. Usin k=2.



1.  (2 points) Based on what you’ve seen so far, which value of K (K=2 or K=3) provides more useful
insight into bike rental patterns? Why?

- I wasn't able to find large distinctins, 


### 5 Elbow Method (11 points)
Use the elbow method with inertia scores to approximate an ideal value of K. Once you have done this,
perform a K-means clustering with this value of K you discovered (6 points). Answer the following questions:


11. (1 point) How many different rental periods are represented in each cluster?


12. (4 points) Using averaged columns within each cluster, give a profile of a low-count rental period and
a high-count rental period. Why do you think fewer people are renting bikes in the low-count rental
period?


### Submission Instructions
In Blackboard, submit written responses in an appropriate text format (PDF, Word, LibreOffice, etc) and
your *.ipynb file(s). Do not submit a share link.
2