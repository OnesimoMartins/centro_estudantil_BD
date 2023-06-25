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
    END