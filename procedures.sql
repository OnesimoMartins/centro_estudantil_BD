use centro_estudantil;

DELIMITER //
CREATE PROCEDURE FINALIZAR_PERIODO_ESCOLAR()
BEGIN

# CRIANDO NOVO PERIODO ESCOLAR
declare data_fim date;
declare data_inicio date;

select pe.data_fim into  data_inicio  from periodo_escolar pe order by pe.id desc limit 1;
select DATE_ADD((select pe.data_fim  from periodo_escolar pe order by pe.id desc limit 1),interval  1 year) into data_fim;
 
# ALUNOS QUE REPROVARAM DUAS VEZES
INSERT INTO  aluno_baixa(id_aluno, id_baixa)  
SELECT r.id_aluno as id_aluno, 1
FROM reprovacao r
         INNER JOIN periodo_escolar p ON p.id = r.id_periodo_escolar
WHERE EXISTS (
    SELECT 1
    FROM reprovacao r2
             INNER JOIN periodo_escolar p2 ON p2.id = r2.id_periodo_escolar
    WHERE r.id_aluno = r2.id_aluno
      AND YEAR(p2.data_fim) - YEAR(p.data_inicio) = 1
)
GROUP BY r.id_aluno
HAVING COUNT(DISTINCT YEAR(p.data_inicio)) >= 2;

# MARCAR AUNO COMO INAIVO
UPDATE aluno al set al.estado=false 
WHERE id IN (SELECT r.id_aluno
             FROM reprovacao r
                      INNER JOIN periodo_escolar p ON p.id = r.id_periodo_escolar
             WHERE EXISTS (
                 SELECT 1
                 FROM reprovacao r2
                          INNER JOIN periodo_escolar p2 ON p2.id = r2.id_periodo_escolar
                 WHERE r.id_aluno = r2.id_aluno
                   AND YEAR(p2.data_fim) - YEAR(p.data_inicio) = 1
             )
             GROUP BY r.id_aluno
             HAVING COUNT(DISTINCT YEAR(p.data_inicio)) >= 2);
        
#PROMOVER ALUNOS PARA PROXIMA CLASSE
INSERT INTO  aluno_baixa(id_aluno, id_baixa)  
SELECT r.id_aluno as id_aluno, 1
FROM reprovacao r
         INNER JOIN periodo_escolar p ON p.id = r.id_periodo_escolar
WHERE NOT EXISTS (
    SELECT 1
    FROM reprovacao r2
             INNER JOIN periodo_escolar p2 ON p2.id = r2.id_periodo_escolar
    WHERE r.id_aluno = r2.id_aluno
      AND YEAR(p2.data_fim) - YEAR(p.data_inicio) = 1
)
GROUP BY r.id_aluno
HAVING COUNT(DISTINCT YEAR(p.data_inicio)) >= 2;


END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE INICIAR_PERIODO_ESCOLAR()
BEGIN
    -- Corpo do procedimento
END //
DELIMITER ;