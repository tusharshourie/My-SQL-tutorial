use temp;
create table pairs( A INT, B INT);

insert into pairs values (1,2), (2,4), (2,1), (3,2), (4,2), (5,6), (6,5), (7,8);
select * from pairs;


-- remove reversed pairs
-- METHOD 1 : JOINS
SELECT lt.* FROM PAIRS lt left join pairs rt on lt.A = rt.B and lt.b = rt.a
where rt.a is null or lt.a < rt.a;

-- METHOD 2 : CORELATED SUBQUERY
select * from pairs p1 where not exists (select * from pairs p2 where p1.b = p2.a and p1.a = p2.b and p1.a > p2.a);