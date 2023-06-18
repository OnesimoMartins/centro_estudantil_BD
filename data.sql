/*  DADOS  */

use centro_estudantil;

insert into periodo_escolar(data_inicio,data_fim) values 
('2020-01-09','2021-01-09'),('2021-01-09','2022-01-09'),('2022-01-09','2022-01-03'),('2023-01-03','2024-01-09');

insert into classe(numero) values(1),(2),(3),(4),(5),(6);

insert into disciplina(nome) values
('Matemática'),('Língua portuguesa'),('Ed.Musical'),('Estudo do meio'),('Ed.Moral'),('Química'),('Física');

insert into classe_disciplina(id_classe,id_disciplina,periodo_escolar_id) values 
(1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),
(1,2,1),(1,3,1),(2,3,1),(4,3,1),(6,7,1),(6,6,1);