CREATE TABLE tarefas(
	id SERIAL PRIMARY KEY,
	texto VARCHAR(200) NOT NULL,
	ativo BOOLEAN DEFAULT TRUE
);

INSERT INTO tarefas (texto, ativo) VALUES
('Comprar pão e leite', TRUE),
('Estudar PostgreSQL', TRUE),
('Ligar para o João', FALSE),
('Agendar consulta médica', TRUE),
('Organizar a mesa do escritório', TRUE),
('Fazer backup do computador', FALSE),
('Finalizar relatório semanal', TRUE),
('Levar o cachorro para passear', TRUE),
('Pagar contas de luz e água', FALSE),
('Assistir aula de matemática', TRUE);


