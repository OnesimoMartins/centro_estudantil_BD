/*  DADOS  */

use centro_estudantil;

insert into classe(numero) values(1),(2),(3),(4),(5),(6);

insert into aluno (nome,sobrenome,sexo) values
                                            ('Catia','Elias','F'),
                                            ('Tomas','Machado','M'),
                                            ('Antonio','Ngola','M'),
                                            ('Patrick','Jack','M'),
                                            ('Edson','Conceicao','M'),
                                            ('Rafael','Miguel','M'),
                                            ('Edna','Elias','F'),
                                            ('Marilia','AG','F'),
                                            ('Nadia','Mendonca','F'),
                                            ('Ebora','Rafa','F'),
											('Eugénio','Chimuco','M'),
                                            ('Edga','Felipe','F'),
                                            ('Nadio','GG','M');

insert into periodo_escolar(data_inicio,data_fim,qtd_vagas) values
                                                      ('2020-01-09','2021-01-09',10),
                                                      ('2021-01-09','2022-01-09',8);
                                                      
insert into periodo_escolar_classe_aluno(id_classe,id_aluno,periodo_escolar_id)
values (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,11,1)  ,  (2,1,2),(2,2,2),(2,3,2),(1,4,2),(2,12,2);

insert into grupo(numero,classe_id) values (1,1),(2,1),(3,1),  (1,1),(2,1),(3,1);
insert into aluno_grupo(id_aluno,id_grupo,periodo_escolar_id) values
                                                                  (1,1,1), (2,1,1),(3,1,1),
                                                                  (4,2,1),(5,2,1),(6,2,1),
                                                                  (7,3,1),(8,3,1),(9,3,1),(10,3,1),
                                                                  (11,4,1),

                                                                  (1,3,2), (2,3,2),(3,3,2),
                                                                  (4,2,2),(5,2,2),(6,2,2),
                                                                  (7,1,2),(8,1,2),(9,1,2),(10,1,2),
                                                                  (12,3,2);

#                                                                   (1,1,3), (2,1,3),(3,1,3),
#                                                                   (4,3,3),(5,3,3),(6,3,3),
#                                                                   (7,2,3),(8,2,3),(9,2,3),(10,2,3),
#
#                                                                   (1,1,4),(2,1,4),(3,1,4),
#                                                                   (4,2,4),(5,2,4),(6,2,4),
#                                                                   (7,2,4),(8,2,4),(9,2,4),(10,2,4);
#

                                                                  insert into tipo_baixa(descricao) values ('Reprovação'),('transferência'),('doença'),('culminação dos estudos');

insert into aluno_baixa(id_aluno,id_baixa) values (11,2),(12,3);

insert into disciplina(nome) values
                                 ('Matemática'),('Língua portuguesa'),('Ed.Musical'),('Estudo do meio'),('Ed.Moral'),('Química'),('Física');

insert into classe_disciplina(id_classe,id_disciplina,periodo_escolar_id) values
                                                                              (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),
                                                                              (1,2,1),(1,3,1),(2,3,1),(4,3,1),(6,7,1),(6,6,1);

insert into grupo(numero,classe_id) values (1,1),(2,1),(3,1) , (1,1),(2,1),(3,1);

insert into avaliacao(id_disciplina,id_aluno,id_periodo_escolar,trimestre,nota) values
                                                                                    (1,1,1,1,8), (1,1,1,2,10), (1,1,1,3,2),
                                                                                    (2,1,1,1,10), (2,1,1,2,10), (2,1,1,3,10),
                                                                                    (3,1,1,1,3), (3,1,1,2,2), (3,1,1,3,0);

insert into reprovacao( id_aluno,id_periodo_escolar) values (1,1),(2,1),(3,1) ;