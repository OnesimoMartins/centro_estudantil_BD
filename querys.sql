use centro_estudantil;

select * from classe_disciplina;
select * from classe;



-- 1.	Lista dos alunos por grupo 
select FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR,
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
where 0=0;

-- 2.	Lista das disciplinas leccionadas em cada classe
select c.numero as classe , d.nome as disciplina ,
FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR 
from classe_disciplina  cd
inner join disciplina d on d.id= cd.id_disciplina
inner join classe c on c.id=cd.id_classe
inner join periodo_escolar pe on cd.periodo_escolar_id= pe.id
where 0=0 order by pe.id, c.numero;


-- 	3.	Lista das avaliações por grupo em cada disciplina

select distinct FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR
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

-- 4.	Lista dos alunos por grupo 

# where 0=0 order by (pe.id);



# 7.	Lista dos alunos Reprovados por grupo
select distinct FORMAT_PERIODO_ESCOLAR(pe.data_inicio,pe.data_fim) as PERIODO_ESCOLAR
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

#4. Lista das médias finais obtidas pelos alunos em cada classe.
SELECT 
    CASE
        WHEN trimestre = 1 THEN 'Trimestral'
        WHEN trimestre = 2 THEN 'Semestral'
        WHEN trimestre = 3 THEN 'Anual'
    END AS periodo,
    pe.id AS periodo_escolar_id,
    c.numero AS classe_numero,
    g.numero AS grupo_numero,
    ROW_NUMBER() OVER (PARTITION BY c.id, g.id, pe.id ORDER BY a.nome, a.sobrenome) AS numero_lista,
    CONCAT(a.nome, ' ', a.sobrenome) AS nome_completo,
    AVG(av.nota) AS media_obtida
FROM aluno a
INNER JOIN aluno_grupo ag ON ag.id_aluno = a.id
INNER JOIN grupo g ON g.id = ag.id_grupo
INNER JOIN periodo_escolar pe ON pe.id = ag.periodo_escolar_id
INNER JOIN classe c ON c.id = g.classe_id
LEFT JOIN avaliacao av ON av.id_aluno = a.id AND av.id_periodo_escolar = pe.id
GROUP BY pe.id, c.id, g.id, a.id
ORDER BY pe.id, c.id, g.id, numero_lista;

# 5.	Lista por ponderado
SELECT 
    pe.id AS periodo_escolar_id,
    c.numero AS classe_numero,
    NULL AS grupo_numero,
    ROW_NUMBER() OVER (PARTITION BY pe.id, c.id ORDER BY AVG(av.nota) DESC) AS numero_lista_merito,
    CONCAT(a.nome, ' ', a.sobrenome) AS nome_completo,
    AVG(av.nota) AS media_acumulada,
    ROW_NUMBER() OVER (PARTITION BY pe.id, c.id ORDER BY a.nome, a.sobrenome) AS numero_lista,
    a.sexo
FROM aluno a
INNER JOIN aluno_grupo ag ON ag.id_aluno = a.id
INNER JOIN grupo g ON g.id = ag.id_grupo
INNER JOIN periodo_escolar pe ON pe.id = ag.periodo_escolar_id
INNER JOIN classe c ON c.id = g.classe_id
LEFT JOIN avaliacao av ON av.id_aluno = a.id AND av.id_periodo_escolar = pe.id
GROUP BY pe.id, c.id, a.id
ORDER BY pe.id, c.id, numero_lista_merito;