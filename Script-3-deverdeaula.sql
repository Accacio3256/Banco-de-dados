--Questão 1
select
	count(*)
from
	film f
inner join "language" l on
	l.language_id = f.language_id
where
	l.name = 'Português'; -- R: 0

--Questão 2 
select
	count(*)
from
	rental r
inner join inventory i 
on
	r.inventory_id = i.inventory_id
inner join film f 
on
	i.film_id = f.film_id
where
	f.film_id = 7;

--Questão 3
select
	count(*)
from
	rental r;
-- R: 16.044

--Questão 4
select
	replacement_cost
from
	film f
where
	film_id = 600;
--R: 16,99

--Questão 5
select
	s.first_name, s.last_name 
from
	staff s
inner join rental r on
	s.staff_id = r.staff_id 
group by
	s.first_name, s.last_name
order by 
	count(r.rental_id) desc 
limit 1;
-- R: Mike
	
--Questão 6
select
	count(s.staff_id)
from
	staff s
inner join address a on
	a.address_id = s.address_id
group by
	s.staff_id;


select a.address, count((*) from staff s inner join store s on s.store_id = sto.store_id inner join address a on a.address_id - sto.address_id group by a.address
--R: (OBS: utilizei o endereço, já que o endereço é único por loja, aí eu vejo a quantidade de staff ligado à ele)
--R==  em uma loja tem 1 e na outra 1 tmb

--Questão 7
select
	f.title ,
	f.replacement_cost,
	l."name",
	r.last_update,
	r.customer_id,
	c.first_name,
	s.first_name,
	f.rental_rate
from
	film f,
	"language" l,
	rental r,
	customer c,
	staff s;
-- Tô devendo

--Questão 8
select f.film_id =1, count(a.first_name) from film f 
inner join film_actor fa on fa.film_id = f.film_id
inner join actor a on a.actor_id = fa.actor_id 
where a.first_name like 'P%';
-- tô devendo tmb

OBS: eu salvei mas subtitui pro errado, ent ta faltando
