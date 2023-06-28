use centro_estudantil;

DELIMITER //
CREATE PROCEDURE FINALIZAR_PERIODO_ESCOLAR()
BEGIN

# CRIANDO NOVO PERIODO ESCOLAR
declare data_fim date;
declare data_inicio date;

select pe.data_fim into  data_inicio  from periodo_escolar pe order by pe.id desc limit 1;
select DATE_ADD((select pe.data_fim  from periodo_escolar pe order by pe.id desc limit 1),interval  1 year) into data_fim;
 
 # CÁLCULO DAS VAGAS
        
        
#PROMOVER ALUNOS PARA PROXIMA CLASSE
insert into 
    -- Corpo do procedimento

insert into alu
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE INICIAR_PERIODO_ESCOLAR()
BEGIN
    -- Corpo do procedimento
END //
DELIMITER ;