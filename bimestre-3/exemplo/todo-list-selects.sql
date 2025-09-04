-- Contagem de tasks criadas
SELECT COUNT(*) FROM tarefas;
-- Contagem de tasks concluidas
SELECT COUNT(*) FROM tarefas WHERE ativo = FALSE;
-- Listagem de tasks
SELECT * FROM tarefas ORDER BY id; 