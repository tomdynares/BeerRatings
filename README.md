## Metis Introduction to Data Science - Final Project (as of 2/19/2018)

The dataset that will be used for this project is titled `beer_reviews.csv` and originates from https://data.world/socialmediadata/beeradvocate

This dataset consists of `1,586,614` observations and has `13` columns as follows:
* `brewery_id`            int64
* `brewery_name`          object
* `review_time`           int64
* `review_overall`        float64
* `review_aroma`          float64
* `review_appearance`     float64
* `review_profilename`    object
* `beer_style`            object
* `review_palate`         float64
* `review_taste`          float64
* `beer_name`             object
* `beer_abv`              float64
* `beer_beerid`           int64

## Techs to explore
I plan to use many if not all of the techs being taught in this class as well as any others I might come across. As I answer the below questions, I will update with tech used and what I observed.  I will likely also add a section here to discuss the different technologies used and explain how they behaved on their particular applications.


## Some complications to iron out in this dataset
* Any given reviewer may rate the same beer (beer_id) multiple times - need to average their results (note: this will be valid only when we are not doing time based analysis)
* Review_time will need to be converted to actual datetime object
* Analysis will need to be conducted to assess duplicates and other data anomalies

## Some questions to be asked of this dataset
`1-` Is there a steady relationship between appearance, aroma, taste across different beer styles - can an overall rating be predicted based on training data from a given beer style against a different distinct beer style.  

`2-` Of aroma, appearance, palate and taste - what attribute or combo of attributes can lead to an average review (=3), poor review (<3) good review (>3) - what techs to use? linear regression, decision tree, random forest

`3-` How biased are raters to begin with e.g.  if a given rater has provided consistently high marks for a given beer style, how does this compare with different beer styles they have reviewed

`4-` beer_abv - Is there a predictable correlation between this and any of the ratings we might expect to see on any combo of aroma, appearance, palate and taste - can ratings in these areas predict a range of ABV? 

`5-` Amongst reviewers that do reviews across multiple beer styles, is there a correlation between how they rate aroma, palate, etc

`6-` Do certain beer styles get higher ratings during certain times of year - is there a correlation?

Note: Due to time contraints the only question being answered in this project is question 1.  Having worked with this question extensively I feel it offers the opportunity to explore in detail many if not most of the technology taught in this class.

## Project notebooks
This project will be split across multiple notebooks as follows

[`1 - Explore the Data:`](https://github.com/tomdynares/BeerRatings/blob/master/notebooks/1-Explore%20Data.ipynb) this notebook introduces the intial data set in its entirety and starts exploring certain relationships. It further conducts some descriptive analytics in order to better guage opportunities for enhanced data analysis.

[`2 - Additional Feature Exploration:`](https://github.com/tomdynares/BeerRatings/blob/master/notebooks/2%20-%20Additional%20Feature%20Exploration.pynb) this notebook builds on the first by conducting summary statistics on both reviewer_profilename and beer_style resulting in the `beer_style_summary.csv` detailed below.

[`3 - Answer question 1:`](https://github.com/tomdynares/BeerRatings/blob/master/notebooks/3%20-%20Answer%20question%201.pynb) this notebook utilizes numerous techs (Linear Regression, Decision Tree, Bagged and Random Forest).  It focuses on predicting the overall review ranking `review_overall` and makes an important discovery: All forementioned techs return predictions in continous values (3.162, 4.375, etc) and all target values are stored in .5 increments (3.0, 3.5, 4.0, etc).  An attempt is made to scale/normalize the predicted values and then check the RMSE (which oddly enough is higher than it was using the initial predicted values un-scaled/normalized.

[`4 - Explore why RMSE was higher:`](https://github.com/tomdynares/BeerRatings/blob/master/notebooks/4%20-%20Explore%20why%20RMSE%20was%20higher.pynb) this notebook will revisit the discovery we made while trying to answer question 1 by conducting analysis on the results for both actual predicted values and scaled/normalized predicted values vs actual values.  Ultimately another even more important discovery will be revealed - this question is actually a classification problem NOT a linear problem and therefore an entirely different approach will need to be taken.

[`5 - Answer question 1 as a classification problem:`](https://github.com/tomdynares/BeerRatings/blob/master/notebooks/
5%20-%20Answer%20question%201%20as%20a%20classification%20problem.pynb) this notebook will revisit the initial question only this time utilizing classification technologies.


## Project data
This project will contain a variety of datasets depending upon the analysis being conducted,  All datasets will be derived from the initial `beer_reviews.csv`.

* `beer_reviews.csv` - This is the primary dataset for the project, unfortunately it is too large to include in git hub.  I will try to zip it and see if that works, otherwise it may be downloaded from [here](https://data.world/socialmediadata/beeradvocate)

* `beer_reviews_reducded.csv` - A condensed (fewer records) of the initial `beer_reviews.csv` dataset
 
* `beer_reviews_minimal.csv` - A greatly condensed (minimal records) of the initial `beer_reviews.csv` dataset

* `beer_reviews.csv` - This is the primary dataset for the project, unfortunately it is too large to include in git hub.  I will try to zip it and see if that works, otherwise it may be downloaded from [here](https://data.world/socialmediadata/beeradvocate)

* `beer_style_summary` - This contains summary data by beer_style as follows:
	* `beer_style`      				  object
	* `number_of_distinct_reviewers`      int64
	* `number_of_distinct_brewerys`       int64
	* `number_of_distinct_beer`           int64
	* `total_brewerys`                    int64
	* `pct_brewerys`                    float64
	* `mean_distinct_brewerys`          float64
	* `sd_distinct_brewerys`            float64
	* `Z_distinct_brewerys`             float64
	* `total_reviewers`                   int64
	* `pct_reviewers`                   float64
	* `mean_distinct_reviewers`         float64
	* `sd_distinct_reviewers`           float64
	* `Z_distinct_reviewers`            float64
	* `total_beer`                        int64
	* `pct_Beer`                        float64
	* `mean_distinct_beer`              float64
	* `sd_distinct_beer`                float64
	* `Z_distinct_beer`                 float64

* `beer_reviewer_summary` - This contains summary data by reviewer_profile_name as follows:
	* `review_profilename`      		  object
	* `number_of_distinct_brewerys`       int64
	* `number_of_distinct_beer`           int64
	* `total_brewerys`                    int64
	* `pct_brewerys`                    float64
	* `mean_distinct_brewerys`          float64
	* `sd_distinct_brewerys`            float64
	* `Z_distinct_brewerys`             float64
	* `total_beer`                        int64
	* `pct_Beer`                        float64
	* `mean_distinct_beer`              float64
	* `sd_distinct_beer`                float64
	* `Z_distinct_beer`                 float64

## Other artifacts
Being a SQL kinda guy, I built an SSIS package (in the SSIS folder) then moved all 1.5million observations into a database.... I further created an SQL folder where I will store any SQL queries I use as sanity check.  The following files may be found here:

* `beer_style_calcs.sql` - This query was used to compare results between SQL Server and Python in terms of calculations perfomred in the `Step 1 - Explore the Data:` notebook.