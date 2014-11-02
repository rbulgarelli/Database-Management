--Rosemary Bulgarelli --
-- 10/15/2014 --
-- Lab 6 --

--1-- 
select distinct c.name, c.city
from customers c, products p
where c.city=p.city and p.city in (select p.city
				     from products p
				 group by p.city
	                         order by count(city) DESC 
				    limit 1
				  )
order by c.name ASC;
--No customers live in Newark :( --

--2--	
select distinct c.name, c.city
from customers c, products p
where c.city=p.city and p.city in (select p.city
				     from products p
				 group by p.city
	                         order by count(city)DESC 
				    limit 2
				  )
order by c.name ASC;
--Still no customers in Newark :( --

--3--
select *
from products 
where priceUSD > (select avg(priceUSD)
                    from products
                 )
order by pid ASC;

--4--
select c.name, o.pid, o.dollars
from customers c, orders o 
where c.cid=o.cid
order by o.pid ASC;

--5--
select c.name, coalesce(sum(o.qty),0)
from customers c
left outer join orders o
	     on c.cid=o.cid
group by c.name
order by c.name ASC;

--6--
select c.name, a.name, p.name
from customers c, products p, orders o, agents a
where c.cid = o.cid
  and a.aid = o.aid
  and p.pid = o.pid
  and a.city = 'New York' 
order by c.name ASC;

--7--
select *
from orders o, customers c, products p
where o.cid=c.cid
  and o.pid=p.pid
  and o.dollars != ((o.qty*p.priceUSD)-(o.qty*p.priceUSD)*(c.discount/100)) 
  and o.dollars is not null

--Not sure how correct this one is--


