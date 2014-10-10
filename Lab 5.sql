--Rosemary Bulgarelli--
--Lab 5--
--10/10/2014--

--1--
select distinct a.city
from agents a 
inner join orders o
        on a.aid = o.aid
inner join customers c
	on c.cid=o.cid and c.name = 'Tiptop'
order by city ASC;

--2--
select distinct o2.pid
from orders o1
inner join customers c
        on c.cid = o1.cid 
inner join orders o2
        on o2.aid = o1.aid and c.city = 'Kyoto' 
order by pid ASC;

--3--	
select name
from customers
where cid not in (select distinct cid
	            from orders
	         )
order by name ASC;

--4--
select distinct customers.name
from customers 
left outer join orders 
	     on customers.cid = orders.cid
where orders.cid is null
order by name ASC;

--5--
select distinct c.name, a.name
from customers c, orders o, agents a
where c.cid = o.cid 
  and a.aid= o.aid 
  and c.city=a.city
order by c.name ASC;

--6--
select c.name, a.name, c.city
from customers c, agents a
where c.city=a.city
order by c.city ASC;

--7-- 
select distinct c.name, c.city
from customers c, products p
where c.city=p.city 
  and p.city in (select city
		 from products 
		 group by city limit 1
                )	
order by c.name ASC;
				   