## Metis Introduction to Data Science - Final Project (as of 2/11/2018)

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
1- Is there a steady relationship between appearance, aroma, taste across different beer styles - can an overall rating be predicted based on training data from a given beer style against a different distinct beer style.  
`2-` Of aroma, appearance, palate and taste - what attribute or combo of attributes can lead to an average review (=3), poor review (<3) good review (>3) - what techs to use? linear regression, decision tree, random forest
3- How biased are raters to begin with e.g.  if a given rater has provided consistently high marks for a given beer style, how does this compare with different beer styles they have reviewed
4- beer_abv - Is there a predictable correlation between this and any of the ratings we might expect to see on any combo of aroma, appearance, palate and taste - can ratings in these areas predict a range of ABV? 
5- Amongst reviewers that do reviews across multiple beer styles, is there a correlation between how they rate aroma, palate, etc
6- Do certain beer styles get higher ratings during certain times of year - is there a correlation?

## Project notebooks
This project will be split across multiple notebooks as follows

* `1- Step 1 - Explore the Data:` this notebook introduces the intial data set in its entirety and starts exploring certain relationships. It further conducts some descriptive analytics in order to better guage opportunities for enhanced data analysis.
*  `more to be added as the project evolves`


## Project data
This project will contain a variety of datasets depending upon the analysis being conducted,  All datasets will be derived from the initial `beer_reviews.csv`.

* `beer_reviews.csv` - This is the primary dataset for the project, unfortunately it is too large to include in git hub.  I will try to zip it and see if that works, otherwise it may be downloaded from https://data.world/socialmediadata/beeradvocate