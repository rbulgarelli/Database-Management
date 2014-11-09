--1--
select distinct city
from agents
where aid in(select distinct aid
	     from orders
	     where cid in (select cid
			   from customers
			   where name='Tiptop'
			   )
	    )
order by city ASC;

--2--
select distinct pid
from orders
where aid in(select aid
	     from orders
	     where orders.cid in (select distinct cid
	        	   from customers
			   where city='Kyoto' and customers.cid=orders.cid
			   )
	    )
order by pid ASC;

--3--
select cid, name
from customers
where cid not in(select distinct cid
	         from orders
	         where aid = 'a04' 
	         )
order by cid ASC;

--4--
select cid,name
from customers 
where cid in (select distinct cid
	      from orders
	      where pid = 'p01'  and cid in (select distinct cid
					     from orders
					     where pid = 'p07'
					    )
	     )
order by cid ASC;

--5--
select distinct pid
from orders
where cid in(select distinct cid
	     from orders
	     where aid = 'a04'
	    )
order by pid ASC;	  
  
--6--
select name, discount
from customers
where cid in (select distinct cid
	      from orders
	      where aid in (select aid
	                    from agents
			    where city = 'Dallas' 
			       or city = 'Newark'
			    )
	      )
order by name ASC;

--7--	
select *
from customers 
where city != 'Dallas' 
  and city != 'Kyoto'
  and discount in (select discount 
		     from customers 
		    where city = 'Dallas'
		       or city = 'Kyoto'
		   )
order by cid ASC;	 