-- Rosemary Bulgarelli -- 
-- 11/18/2014 --
-- Lab 10: Stored Procedure --
 
-- 1. function PreReqsFor --
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
   course_num int      :=$1;
   resultset REFCURSOR :=$2;
begin
   open resultset for
      select prereqnum
      from prerequisites
      where coursenum = course_num;
   return resultset;
end;
$$
language plpgsql;

-- Test for function PreReqsFor --	
select PreReqsFor(499, 'results');
Fetch all from results;


-- 2. function IsPreReqFor --
create or replace function isPreReqFor(int, REFCURSOR) returns refcursor as
$$
declare
  course_num int      :=$1;  
  resultset REFCURSOR :=$2;
begin
  open resultset for
     select coursenum
     from prerequisites
     where prereqnum = course_num;
  return resultset;
end;
$$
language plpgsql;

-- Test for function PreReqsFor --	
select PreReqsFor(221, 'results');
Fetch all from results;

