use centro_estudantil;

#APAGAR
DROP INDEX idx_aluno_nome ON aluno;
DROP INDEX idx_aluno_sobrenome ON aluno;
DROP INDEX idx_classe_numero ON classe ;
DROP INDEX idx_periodo_escolar_data_inicio ON periodo_escolar ;
DROP INDEX idx_periodo_escolar_data_fim ON periodo_escolar ;
DROP INDEX idx_disciplina_nome ON disciplina;
DROP INDEX idx_grupo_numero ON grupo;
DROP INDEX idx_tipo_baixa_descricao ON tipo_baixa;


#CRIAR
CREATE INDEX idx_aluno_nome ON aluno (nome);
CREATE INDEX idx_aluno_sobrenome ON aluno (sobrenome);

CREATE INDEX idx_classe_numero ON classe (numero);

CREATE INDEX idx_periodo_escolar_data_inicio ON periodo_escolar (data_inicio);
CREATE INDEX idx_periodo_escolar_data_fim ON periodo_escolar (data_fim);

CREATE INDEX idx_disciplina_nome ON disciplina (nome);

CREATE INDEX idx_grupo_numero ON grupo (numero);

CREATE INDEX idx_tipo_baixa_descricao ON tipo_baixa (descricao);
