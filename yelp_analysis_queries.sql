-- 10 Questions 

--1. Find the Number Of busness in each category
WITH cte AS (
    SELECT 
        business_id, 
        TRIM(A.value) AS category 
    FROM tbl_yelp_businesses,
    LATERAL SPLIT_TO_TABLE(categories, ',') A
)
select category, count(*) as no_of_business 
from cte
group by category
order by no_of_business desc







--2. Find the Top 10 users who have reviewed the most businesses in 'Restaurants' category

select r.user_id, count(distinct r.review_text) as no_of_reviews
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on b.business_id = r.business_id
WHERE b.categories ilike '%restaurant%'
group by r.user_id
order by no_of_reviews desc
limit 10



y
--3. Find the most popular categories of businesses {based on the number of reviews}

WITH cte AS (
    SELECT 
        business_id, 
        TRIM(A.value) AS category 
    FROM tbl_yelp_businesses,
    LATERAL SPLIT_TO_TABLE(categories, ',') A
)
select category, count(*) as no_of_reviews
from cte 
inner join tbl_yelp_reviews r on cte.business_id=r.business_id
group by category
order by no_of_reviews desc




--4. Find the top 3 most recent reviews for each business.

with cte as (
select r.*, b.name,
row_number() over (partition by r.business_id order by review_date desc ) as rn
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on b.business_id = r.business_id
)
select * from cte 
where rn<=3


--5. Find the Month With Highest reviews of month.

select month(review_date) as review_month, count(*) as no_of_reviews
from tbl_yelp_reviews 
group by review_month
order by no_of_reviews desc


--6. Find the Percentage of 5 star reviews for each business

select b.business_id, b.name, count(*) as total_reviews,
sum(case when r.review_stars=5 then 1 else 0 end) as five_star_reviews,
five_star_reviews*100/total_reviews as five_star_percent
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on b.business_id = r.business_id
group by b.business_id, b.name


--7. Find the top 5 most reviewed businees in each categoty.

with cte as (
    select b.city, b.business_id, b.name, count(*) as total_reviews
    from tbl_yelp_reviews r
    inner join tbl_yelp_businesses b on r.business_id=b.business_id
    group by b.city, b.business_id, b.name
)
select *
from cte
qualify row_number() over (partition by city order by total_reviews) <=5


--8. Find the average ratings of businesses that have atleast 100 reviews

select b.business_id, b.name, count(*) as total_reviews,
avg(review_stars) as avg_rating
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on r.business_id = b.business_id
group by b.business_id, b.name
having count(*) > 100


--9. List the Top 10 users who have written the most reviews, along with the busineeses they reviewed.

with cte as (
  select r.user_id, count(*) as total_reviews
  from tbl_yelp_reviews r
  inner join tbl_yelp_businesses b on r.business_id=b.business_id
  group by 1
  order by 2 desc
  Limit 10
)
select user_id,business_id
from tbl_yelp_reviews where user_id in (select user_id from cte)
group by user_id,business_id
order by user_id


--10. Find the Top 10 busineeses with highest positive sentiment reviews.



select r.business_id, b.name, count(*) as total_reviews
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on r.business_id=b.business_id
where sentiments = 'Positive'
group by  r.business_id, b.name
order by total_reviews desc
Limit 10
`