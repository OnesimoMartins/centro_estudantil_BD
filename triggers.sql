use centro_estudantil;

DELIMITER //
create trigger inserir_avaliacao AFTER  INSERT ON avaliacao
    FOR EACH ROW
BEGIN

    declare totalDisciplinasReprovadas int;
    declare jaReprovado int;

    IF NEW.trimestre = 3 then

        SELECT COUNT(*) AS DisciplinasAbaixoDe5 into totalDisciplinasReprovadas
        FROM (
                 SELECT av.id_disciplina, SUM(av.nota)/3 AS media
                 FROM avaliacao av
                          INNER JOIN disciplina d ON d.id = av.id_disciplina
                          INNER JOIN aluno al ON al.id = av.id_aluno
                 WHERE av.id_aluno = new.id_aluno AND av.id_periodo_escolar = NEW.id_aluno
                 GROUP BY av.id_disciplina
                 HAVING media < 5
             ) AS subquery;

        select count(*) into jaReprovado from reprovacao r where
                                     r.id_periodo_escolar=NEW.id_periodo_escolar and r.id_aluno=NEW.id_aluno;

        if jaReprovado < 1 and totalDisciplinasReprovadas>1 then
            insert into reprovacao(id_aluno, id_periodo_escolar)
            values (NEW.id_aluno,NEW.id_periodo_escolar);
        end if;

  end if;

END //
DELIMITER ;