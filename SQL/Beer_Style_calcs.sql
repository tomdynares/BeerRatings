create table #tmp_BeerByStyle( 
	beer_style varchar(256),
	number_of_distinct_brewerys int,
	pct_Breweries float,
	total_brewerys int,

	number_of_distinct_reviewers int,
	pct_Reviewers float,
	total_reviewers int,

	number_of_distinct_beer int,
	pct_Beer float,
	total_beer int
	)

	insert #tmp_BeerByStyle
	select beer_style,
	-- breweries 
		number_of_distinct_brewerys, 
		convert(float,number_of_distinct_brewerys) / convert(float,distinct_brewerys) pct_Breweries,
		distinct_brewerys,		
	-- reviewers
		number_of_distinct_reviewers,
		convert(float,number_of_distinct_reviewers) / convert(float,distinct_reviewers) pct_Reviewers,
		distinct_reviewers,
	-- beer
		number_of_distinct_beer,
		convert(float,number_of_distinct_beer) / convert(float,distinct_beer) pct_Beer,
		distinct_beer
	--into #tmp_BeerByStyle
	from (
		select 
			beer_style, 
			(count(distinct brewery_name)) number_of_distinct_brewerys,
			(count(distinct review_profilename)) number_of_distinct_reviewers,
			(count(distinct beer_name)) number_of_distinct_beer,
			count(*) number_of_reviews			
		from beer_reviews_raw br
		group by beer_style
		) a
	cross join (select 
					(count(distinct brewery_name)) distinct_brewerys,
					(count(distinct review_profilename)) distinct_reviewers,
					(count(distinct beer_name)) distinct_beer,
					count(*) reviews
				from beer_reviews_raw
		) b 



	select  
		a.beer_style,
	-- breweries
		a.number_of_distinct_brewerys,
		a.pct_Breweries,
		a.total_brewerys, 
		b.mean_distinct_brewerys,
		b.sd_distinct_brewerys,
		(a.number_of_distinct_brewerys - b.mean_distinct_brewerys) /  b.sd_distinct_brewerys Z_distinct_brewerys,
	-- reviewers
		a.number_of_distinct_reviewers,
		a.pct_Reviewers,
		a.total_reviewers,
		b.mean_distinct_reviewers,
		b.sd_distinct_reviewers,
		(a.number_of_distinct_reviewers - b.mean_distinct_reviewers) /  b.sd_distinct_reviewers Z_distinct_reviewers,
	-- beer
		a.number_of_distinct_beer,
		a.pct_Beer,
		a.total_beer,
		b.mean_distinct_beer,
		b.sd_distinct_beer,
		(a.number_of_distinct_beer - b.mean_distinct_beer) /  b.sd_distinct_beer Z_distinct_beer
--into beer_by_style
	from #tmp_BeerByStyle a
	cross join (
		select 
			avg(number_of_distinct_brewerys) mean_distinct_brewerys,
			stdev(number_of_distinct_brewerys) sd_distinct_brewerys,

			avg(number_of_distinct_reviewers) mean_distinct_reviewers,
			stdev(number_of_distinct_reviewers) sd_distinct_reviewers,

			avg(number_of_distinct_beer) mean_distinct_beer,
			stdev(number_of_distinct_beer) sd_distinct_beer
		from #tmp_BeerByStyle		
		) b 

drop table #tmp_BeerByStyle