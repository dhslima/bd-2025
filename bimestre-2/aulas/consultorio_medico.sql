CREATE TABLE especialidades(
	id INT PRIMARY KEY,
	nome VARCHAR(50)
);
CREATE TABLE medicos(
	id INT PRIMARY KEY,
	crm VARCHAR(10),
	nome VARCHAR(50)
);
CREATE TABLE pacientes(
	id INT PRIMARY KEY,
	nome VARCHAR(50),
	dt_nasc DATE
);
CREATE TABLE consultas(
	id INT PRIMARY KEY,
	data DATE,
	hora TIMESTAMP,
	FK_medico_id INT,
	FK_paciente_id INT,
	FOREIGN KEY(FK_medico_id) REFERENCES medicos(id),
	FOREIGN KEY(FK_paciente_id) REFERENCES pacientes(id)
);
CREATE TABLE prontuarios(
	id INT PRIMARY KEY,
	historico TEXT,
	FK_paciente_id INT,
	FOREIGN KEY(FK_paciente_id) REFERENCES pacientes(id)
);

CREATE TABLE medicos_especialidades(
	FK_medico_id INT,
	FK_especialidade_id INT,
	PRIMARY KEY(FK_medico_id, FK_especialidade_id),
	FOREIGN KEY(FK_medico_id) REFERENCES medicos(id),
	FOREIGN KEY(FK_especialidade_id) REFERENCES especialidades(id)
);
