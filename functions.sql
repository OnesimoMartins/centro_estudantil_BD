drop function IS_ALUNO_REPETENTE;
drop function GET_DISCIPLINA_RESULT;
drop function FORMAT_PERIODO_ESCOLAR;

create function GET_DISCIPLINA_RESULT( id_disciplina int, id_aluno int, id_periodo_escolar int )
    returns varchar(20) READS SQL DATA
    BEGIN
        DECLARE resultado float;
        DECLARE str varchar(30);

        select sum(av.nota)/3 into resultado from avaliacao av where av.id_aluno=id_aluno
                                                and av.id_disciplina=id_disciplina
                                                and av.id_periodo_escolar=id_periodo_escolar;
        IF resultado >= 9 THEN
            SET str = 'APROVADO';
        ELSE
            SET str = 'REPROVADO';
        END IF;

        RETURN str;
    END;
    
    
    
drop function IS_ALUNO_REPETENTE;
create function IS_ALUNO_REPETENTE(id_aluno int, id_periodo_escolar_atual int) returns tinyint(1)
    reads sql data
BEGIN
    declare disciplinas boolean;

    select count( distinct d.id) into disciplinas from avaliacao av
                                        inner join disciplina d on d.id=av.id_disciplina
#     where av.id_aluno=1 and av.id_periodo_escolar=1
        where av.id_aluno=id_aluno and av.id_periodo_escolar=id_periodo_escolar_atual-1
      and GET_DISCIPLINA_RESULT(d.id,1,1) = 'REPROVADO';

    return disciplinas >1;
END;

create function FORMAT_PERIODO_ESCOLAR(data_inicio date, data_fim date) returns varchar(20) deterministic
BEGIN
    declare result varchar(20);
    select CONCAT(year(data_inicio),'/',RIGHT((year(data_fim)),2) ) into result;
    return result;
END;