use centro_estudantil;

drop view if exists ALUNOS_POR_GRUPO_VIEW;
drop view if exists DISCIPLINAS_POR_CLASSE;
drop view if exists AVALIACOES_POR_GRUPO_DISCIPLINA;
drop view if exists ALUNOS_REPROVADOS_POR_GRUPO;
drop view if exists ALUNOS_EM_BAIXA;

#CONSULTA 1
create view ALUNOS_POR_GRUPO_VIEW AS 
SELECT 
       CONCAT(year(pe.data_inicio),'/',RIGHT((year(pe.data_fim)),2) ) as PERIODO_ESCOLAR,
       concat(c.numero,'a') as CLASSE,
       g.numero as GRUPO,
       a.id as CODIGO_ALUNO,
       a.nome as NOME,
       a.sobrenome as APELIDO
       ,ROW_NUMBER() OVER (ORDER BY pe.id) AS NUMERO 
from aluno a
         inner join periodo_escolar_classe_aluno peca on peca.id_aluno = a.id
         inner join periodo_escolar pe on pe.id = peca.periodo_escolar_id
         inner join aluno_grupo ag on ag.id_aluno=a.id and ag.periodo_escolar_id=pe.id
         inner join grupo g on g.id=ag.id_grupo
         inner join classe c on c.id=peca.id_classe;

 select * from ALUNOS_POR_GRUPO_VIEW i;
 
 
#CONSULTA 2 
 create view DISCIPLINAS_POR_CLASSE AS select c.numero as classe , d.nome as disciplina ,
FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR 
from classe_disciplina  cd
inner join disciplina d on d.id= cd.id_disciplina
inner join classe c on c.id=cd.id_classe
inner join periodo_escolar pe on cd.periodo_escolar_id= pe.id
where 0=0 order by pe.id, c.numero;


#CONSULTA 3
 create view AVALIACOES_POR_GRUPO_DISCIPLINA AS select distinct FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR
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

where 0=0;


#CONSULTA 7
 create view ALUNOS_REPROVADOS_POR_GRUPO AS select distinct FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR
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



#CONSULTA 8
 create view ALUNOS_EM_BAIXA AS select distinct
    FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR
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
