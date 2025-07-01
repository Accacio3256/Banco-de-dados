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
	f.title as "Título do filme",
	f.replacement_cost as "Custo de reposição",
	l."name" as "Idioma",
	r.rental_date as "Último aluguel",
	c.first_name as "Nome do cliente",
	r.customer_id as "Id do usuário",
	s.first_name as "Nome do funcionário",
	f.rental_rate as "Valor do aluguel",
	s2.store_id as "Id da loja"
from
	film f
inner join
	"language" l on
	l.language_id = f.language_id
inner join
	inventory i on
	i.film_id = f.film_id
inner join 
	rental r on
	r.inventory_id = i.inventory_id
inner join 
	customer c on
	c.customer_id = r.customer_id
inner join 
	staff s on
	s.staff_id = r.staff_id
inner join 
	store s2 on
	s2.store_id = s.store_id ;

--Questão 8
select f.film_id =1, count(a.first_name) from film f 
inner join film_actor fa on fa.film_id = f.film_id
inner join actor a on a.actor_id = fa.actor_id 
where a.first_name like 'P%';
-- tô devendo tmb
