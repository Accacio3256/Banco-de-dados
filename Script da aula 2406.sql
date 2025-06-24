--comando para excluir tabela--
-- drop table categoria--

create table categoria (
	categoria_id serial,
	nome varchar(80),
	ultima_atualizacao timestamp
	);

create table categoria_filme (
	filme_id int,
	categoria_id int,
	ultima_atualizacao timestamp
	);

create table filme (
	filme_id serial,
	title varchar(50),
	description text,
	ano_de_lancamento char (4),
	lingua_id int,
	duracao_aluguel int,
	preco_aluguel numeric (4,2),
	duracao int,
	custo_reposicao numeric(4,2),
	estrelas numeric (2,1),
	multa numeric (4,2),
	classificacao_indicativa int,
	ultima_atualizacao timestamp,
	ocasiao_especiais Text[],
	sinopse Text[]
	);

create table languagem (
	languagem_id serial,
	lingua varchar (15),
	ultima_atualizacao timestamp
	);

create table fime_ator(
	ator_id serial,
	filme_id serial,
	ultima_atualizacao timestamp
	);

create table inventario (
	inventario_id serial,
	filme_id int,
	loja_id int,
	ultima_atualiacao timestamp
	);


create table aluguel(
	alguel_id serial,
	data_aluguel timestamp,
	inventario_id int,
	cliente_id int,
	data_de_entrega timestamp,
	funcionario_id int,
	ultima_atualizacao timestamp
	);

create table pagamento(
	pagamemto_id serial,
	cliente_id int,
	funcionario_id int,
	alguel_id int,
	quantidade_total int,
	data_de_pagamento timestamp
	);

create table funcionarios(
	funcionario_id serial,
	primeiro_nome char(20),
	sobrenome char (20),
	endereco_id int,
	email varchar (80),
	loja_id int,
	atividade bool,
	nome_de_usuario varchar (40),
	senha varchar (20),
	ultima_atualizacao timestamp,
	foto bytea
	);

create table ator (
	ator_id serial,
	primeiro_nome varchar (12),
	sobrenome varchar (20),
	ultima_atualizacao timestamp
	);

create table cliente (
	cliente_id serial,
	loja_id int,
	primeiro_nome char (12),
	sobrenome char (20),
	email varchar (80),
	endereco_id int,
	ativo bool,
	activebool int,
	data_de_criacao timestamp,
	ultima_atualizacao timestamp
	);

create table endereco (
	endereco_id serial,
	endereco varchar(40),
	endereco2 varchar(40),
	distrito varchar (30),
	cidade_id int,
	cep char(8),
	telefone char(11),
	ultima_atualizacao timestamp
	);

create table cidade (
	cidade_id serial,
	cidade varchar (30),
	pais_id int,
	ultima_atualizacao timestamp
	);
	
create table pais (
	pais_id serial,
	pais varchar(20),
	ultima_atualizacao timestamp
	);
	
create table loja (
	loja_id serial,
	gerente_id int,
	endereco_id int,
	ultima_atualizacao timestamp
	);
	
-- remover coluna 
alter table loja drop column ultima_autualizacao;

-- adicionar coluna
alter table loja add column ultima_atualizacao timestamp;

--renomear coluna 
alter table loja rename column ult_atualizacao;

--alterar o tipo de dado da coluna 
alter table loja alter column ultima_atualizacao set data type timestamp;
	
alter table categoria add primary key (categoria_id);
alter table filme add primary key (filme_id);
alter table linguagem add primary key (categoria_id);
alter table inventario add primary key (inventario_id);
alter table pais add primary key (pais_id);
alter table ator add primary key (ator_id);
alter table cidade add primary key (cidade_id);
alter table loja add primary key (loja_id);
alter table pagamento add primary key (pagamento_id);
alter table endereco add primary key (endereço);
alter table cliente add primary key (cliente);
alter table funcionarios add primary key (funcionario_id);
alter table aluguel add primary key (aluguel_id);

--estrangeiras
alter table categoria_de_filme 
add constraint fk_filme
foreign key (filme_id)
references filme (filme_id);

alter table categoria_de_filme 
add constraint fk_categoria
foreign key (categoria_id)
references categoria (categoria_id);

alter table liguagem 
add constraint fk_liguagem
foreign key (linguagem_id)
references liguagem (linguagem_id);

alter table filme 
add constraint fk_filme
foreign key (filme_id)
references filme (filme_id);


alter table ator_filme 
add constraint fk_ator
foreign key (ator_id)
references ator(ator_id);

alter table ator_filme 
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

alter table inventario --tabela que possui a chave estraingeira
add constraint fk_filme --adiciona restrição na tabela a a ser alterada 
foreign key (filme_id) --define a chave estrangeira na tabela  a ser alterada 
references filme (filme_id); --referencia a tabela que possui a chave primária

alter table aluguel
add constraint fk_inventario
foreign key (inventario_id)
references inventario(inventario_id);

alter table aluguel 
add constraint fk_finaciamento 
foreign key (aluguel_id)
references funcionario(alguel_id);

alter table pagamento 
add constraint fk_aluguel 
foreign key (aluguel_if)
references aluguel(aluguel_id)

alter table pagamento
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario(funcionario_id)

alter table funcionario
add constraint fk_loja

