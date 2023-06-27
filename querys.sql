select * from classe_disciplina;
select * from classe;



-- 1.	Lista dos alunos por grupo 
select CONCAT(year(pe.data_inicio),'/',RIGHT((year(pe.data_fim)),2) ) as PERIODO_ESCOLAR,
       concat(c.numero,'a') as CLASSE,
       g.numero as GRUPO,
       a.id as CODIGO_ALUNO,
       a.nome as NOME,
       a.sobrenome as APELIDO
from aluno a
         inner join periodo_escolar_classe_aluno peca on peca.id_aluno = a.id
         inner join periodo_escolar pe on pe.id = peca.periodo_escolar_id
         inner join aluno_grupo ag on ag.id_aluno=a.id and ag.periodo_escolar_id=pe.id
         inner join grupo g on g.id=ag.id_grupo
         inner join classe c on c.id=peca.id_classe
where pe.id=2;

-- 2.	Lista das disciplinas leccionadas em cada classe
select c.numero as classe , d.nome as disciplina ,
CONCAT(year(p.data_inicio),'/',RIGHT((year(p.data_fim)),2) ) as PERIODO_ESCOLAR 
from classe_disciplina  cd
inner join disciplina d on d.id= cd.id_disciplina
inner join classe c on c.id=cd.id_classe
inner join periodo_escolar p on cd.periodo_escolar_id= p.id
where p.id=1 and c.numero=1;


-- 3.	Lista dos alunos por grupo 

select distinct CONCAT(year(pe.data_inicio),'/',RIGHT((year(pe.data_fim)),2) ) as PERIODO_ESCOLAR
       ,concat(c.numero,'a') as CLASSE
       ,g.numero as GRUPO
       ,d.nome as DISCIPLINA
       ,al.id as CODIGO_ALUNO
       ,al.nome as NOME
       ,al.sobrenome as APELIDO
       ,GET_DISCIPLINA_RESULT(d.id,al.id,pe.id) as NOTA

from avaliacao avaliacao

         inner join periodo_escolar_classe_aluno peca on peca.id_aluno = avaliacao.id_periodo_escolar
         inner join aluno al on al.id = avaliacao.id_aluno
         inner join periodo_escolar pe on pe.id = peca.periodo_escolar_id
         inner join classe c on c.id = peca.id_classe

         inner join aluno_grupo ag on ag.id_aluno=al.id and ag.periodo_escolar_id=pe.id
         inner join grupo g on g.id=ag.id_grupo

         inner join disciplina d on d.id=avaliacao.id_disciplina

where pe.id=1 and al.id=1;

-- 4.	Lista dos alunos por grupo 

# where 0=0 order by (pe.id);



# 7.	Lista dos alunos Reprovados por grupo
select distinct CONCAT(year(pe.data_inicio),'/',RIGHT((year(pe.data_fim)),2) ) as PERIODO_ESCOLAR
       ,concat(c.numero,'a') as CLASSE
       ,g.numero as GRUPO
       ,al.id as CODIGO_ALUNO
       ,d.nome as DICIPLINA
from avaliacao avaliacao
         inner join periodo_escolar_classe_aluno peca on peca.id_aluno = avaliacao.id_periodo_escolar
         inner join aluno al on al.id = avaliacao.id_aluno
         inner join periodo_escolar pe on pe.id = peca.periodo_escolar_id
         inner join classe c on c.id = peca.id_classe
         inner join aluno_grupo ag on ag.id_aluno=al.id and ag.periodo_escolar_id=pe.id
         inner join grupo g on g.id=ag.id_grupo
         inner join disciplina d on d.id=avaliacao.id_disciplina
where   GET_DISCIPLINA_RESULT(d.id,al.id, pe.id) = 'REPROVADO' ;


#8.	Lista, por grupo, dos alunos que causaram baixa
select distinct
    CONCAT(year(pe.data_inicio),'/',RIGHT((year(pe.data_fim)),2) ) as PERIODO_ESCOLAR
              ,concat(c.numero,'a') as CLASSE
              ,g.numero as GRUPO
              ,al.nome as NOME
              ,al.sobrenome as APELIDO
              ,tb.descricao as BAIXA
from aluno_baixa ab
         inner join aluno al on ab.id_aluno= al.id
         inner join tipo_baixa tb on tb.id= ab.id_baixa
         inner join periodo_escolar_classe_aluno peca on peca.id_aluno = al.id
         inner join periodo_escolar pe on pe.id = peca.periodo_escolar_id
         inner join classe c on c.id = peca.id_classe
         inner join aluno_grupo ag on ag.id_aluno=al.id
         inner join grupo g on g.id=ag.id_grupo
where   0=0;

