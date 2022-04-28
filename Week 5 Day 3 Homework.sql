--Week 5 - Wednesday Questions
--1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, district 
from address 
join customer on address.address_id = customer.address_id
where district = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, customer.customer_id, payment.customer_id, amount
from payment 
join customer on customer.customer_id = payment.customer_id 
where amount > 6.99



--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name, customer.customer_id, payment.customer_id, amount
from payment 
join customer on customer.customer_id = payment.customer_id 
where amount = (
	select sum(amount) as total
	from payment
	where total > 175
	)

--4. List all customers that live in Nepal (use the city table)
select customer
from city
join country on country.country_id = city.country_id  
join address on customer.address_id = address.address_id 
--where country = 'Nepal'


--5. Which staff member had the most transactions?
select count(staff_id)
from staff
	where staff_id = (
	select MAX(staff_id)
	from staff
	)


--6. How many movies of each rating are there?
select count(rating)
from film
where rating ='R'


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name, customer.customer_id, payment.customer_id, amount
from payment 
join customer on customer.customer_id = payment.customer_id 
where amount > 6.99 (
	select count(customer_id)
	from payment
	where customer_id = 1
);

--8.How many free rentals did our store give away
select count(amount)
from payment
where amount = '0'
