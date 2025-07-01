--Questão 1 - Filmes em Português
select
	count(*) as "Quantos filme há em Português"
from
	film f
inner join "language" l on
	l.language_id = f.language_id
where
	l."name" = 'Português';

-- R: 0

--Questão 2 - Quantos clientes alugaram o filme de id 7
select
	count(*) as "Quantas pessoas alugaram o filme de id 7"
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

--R:15

--Questão 3 - Total de Aluguéis
select
	count(*) as "Quantidade de aluguéis"
from
	rental r;

-- R: 16.044

--Questão 4 - Custo filme de id 600
select
	replacement_cost as "Custo de reposição do filme de id 600"
from
	film f
where
	film_id = 600;

--R: 16,99

--Questão 5 - Nome do funcionário com mais aluguéis
select
	s.first_name as "Nome do Funcionário com mais Aluguéis",
	s.last_name as "Sobrenome dele",
	count(r.rental_id) as "Número de Aluguéis"
from
	staff s
inner join rental r on
	s.staff_id = r.staff_id
group by
	s.first_name,
	s.last_name
order by 
	count(r.rental_id) desc
limit 1;

-- R: Mike
	
--Questão 6 - Quantos funcionários há em cada loja
select
	count(s.staff_id)
from
	staff s
inner join address a on
	a.address_id = s.address_id
group by
	s.staff_id;

--Ou

select
	a.address,
	count(*)
from
	staff sta
inner join store sto on
	sta.store_id = sto.store_id
inner join address a on
	a.address_id = sto.store_id
group by
	a.address

--(OBS: Na primeira, utilizei o endereço, já que o endereço é único por loja, aí eu vejo a quantidade de staff ligado à ele)
--R==  Em uma loja tem 1 e na outra 1 tmb

--Questão 7 - lista de 8 colunas
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
	s2.store_id = s.store_id
order by (r.rental_date) desc
limit 1 ; 

--R= Zhivago Core, 10,99 , English, 2006-02-14 15:16:03.000, Louis, 373, Jon, 0,99 , 2

--Questão 8 - Quanto atores trabalharam no filme de id 1
select
	count(*) as "Quantidade de atores no filme de id 1"
from
	film_actor fa 
where 
	fa.actor_id = 1;

--R= 19

--Questão - 9 Qual loja tem mais inventários
select 
	s.store_id as "Id da loja",
	count(i.inventory_id)
from 
	store s 
inner join staff s2 on
	s2.store_id = s.store_id 
inner join rental r on
	r.staff_id = s2.staff_id 
inner join inventory i on
	i.inventory_id = r.inventory_id
group by 
	s.store_id 
order by 
	count(i.inventory_id) desc
limit 1;
	
	
