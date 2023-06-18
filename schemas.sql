drop table if exists centro_estudantil;
create database centro_estudantil;
use centro_estudantil;

create table aluno(
id long primary key auto_increment,
nome varchar (100) not null,
sobrenome varchar (100) not null 
);
create table classe (
id int primary key  auto_increment,
numero int not null
);
create table disciplina(
id int primary key auto_increment,
nome varchar(100) not null
);
create table classe_disciplina(
id_classe int references classe(id),
id_disciplina int references classe(id)
);

create table grupo(
id long primary key auto_increment,
numero int not null,
periodo_escolar_id long references periodo_escolar(id)
);



create table periodo_escolar(
id long primary key auto_increment,
ano date not null
);