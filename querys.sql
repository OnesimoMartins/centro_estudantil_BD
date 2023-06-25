select * from classe_disciplina;
select * from classe;

-- seleccionar todas disciplinas de uma classe
select c.numero as classe , d.nome as disciplina ,
 CONCAT(DATE_FORMAT(p.data_inicio,'%d/%m/%Y'),' a ', DATE_FORMAT(p.data_fim,'%d/%m/%Y') ) as  periodo_escolar

 from classe_disciplina  cd
inner join disciplina d on d.id= cd.id_disciplina
inner join classe c on c.id=cd.id_classe
inner join periodo_escolar p on cd.periodo_escolar_id= p.id
where p.id=1 and c.numero=1;


-- 1.	Lista dos alunos por grupo AINDA
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

# where 0=0 order by (pe.id);