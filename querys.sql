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
