drop database if exists  centro_estudantil;
create database centro_estudantil;
use centro_estudantil;

create table aluno(
id int primary key auto_increment,
nome varchar (100) not null,
sobrenome varchar (100) not null ,
sexo enum ('M','F') not null,
estado boolean not null default true -- a ser analisado
);

create table classe (
id int primary key  auto_increment,
numero int not null
);

create table periodo_escolar(
id int primary key auto_increment,
data_inicio date not null,
data_fim date not null
);

create table periodo_escolar_classe_aluno(
 id_classe int references classe(id),
 id_aluno int references aluno(id),
 periodo_escolar_id long references periodo_escolar(id)
);

create table disciplina(
id int primary key auto_increment,
nome varchar(100) not null
);

create table classe_disciplina(
id_classe int references classe(id),
id_disciplina int references classe(id),
periodo_escolar_id long references periodo_escolar(id)
);

create table lista_merito(
 id long primary key  auto_increment,
 numero long primary key  auto_increment,
 periodo_escolar_id long references periodo_escolar(id)
);

create table grupo(
id int primary key auto_increment,
numero int not null
-- , periodo_escolar_id long references periodo_escolar(id) 
);

create table aluno_grupo(
 id_aluno int references aluno(id),
 id_grupo int references grupo(id),
 periodo_escolar_id long references periodo_escolar(id)
 -- utilizamos o periodo para identificar a classe do aluno neste periodo.
);

create table tipo_baixa(
 id int auto_increment,
 descricao varchar(100) null
);

create table aluno_baixa(
 id_aluno int references aluno(id),
 id_baixa int references tipo_baixa(id)
);

create table avaliacao(
 id_disciplina int not null references disciplina(id) ,
 id_aluno int references aluno(id),
 id_periodo_escolar long references periodo_escolar(id),
 trimestre int not null,
 nota float not null
);

create table reprovacao_disciplina(
 id int auto_increment,
 id_disciplina int not null references disciplina(id),
 id_aluno int references aluno(id),
 id_periodo_escolar long references periodo_escolar(id)
);