
===========================
📦 Queries para FieldOpsManager (MySQL)
===========================

🔹 INSERTS

-- Inserir um estado
INSERT INTO estado (nome, sigla) VALUES ('Paraná', 'PR');

-- Inserir uma cidade
INSERT INTO cidade (nome, estado_id) VALUES ('Curitiba', 1);

-- Inserir um endereço
INSERT INTO endereco (rua, bairro, numero, cidade_id) VALUES ('Rua das Flores', 'Centro', '123', 1);

-- Inserir um cliente
INSERT INTO cliente (nome, endereco_id) VALUES ('Cliente A', 1);

-- Inserir um contato do cliente
INSERT INTO contato (nome, telefone, cliente_id) VALUES ('Fulano da Silva', '(41)99999-9999', 1);

-- Inserir um colaborador
INSERT INTO colaborador (re, nome) VALUES ('12345', 'Técnico João');

-- Inserir um equipamento
INSERT INTO equipamentos (nome, tipo) VALUES ('Notebook Dell', 'Informática');

-- Inserir uma OS
INSERT INTO os (cliente_id, colaborador_id, comentarios) VALUES (1, 1, 'Troca de roteador');

-- Inserir script técnico
INSERT INTO scripts (equipamento_id, os_id, script, comentarios) VALUES (1, 1, 'ping 8.8.8.8', 'Teste de conectividade');

🔹 SELECTS

-- Selecionar todos os clientes com nome e endereço
SELECT c.nome AS cliente, e.rua, e.bairro, cid.nome AS cidade, est.nome AS estado
FROM cliente c
JOIN endereco e ON c.endereco_id = e.id
JOIN cidade cid ON e.cidade_id = cid.id
JOIN estado est ON cid.estado_id = est.id;

-- Selecionar OS com dados do cliente e colaborador
SELECT os.id AS ordem_servico, cli.nome AS cliente, col.nome AS colaborador, os.comentarios
FROM os
JOIN cliente cli ON os.cliente_id = cli.id
JOIN colaborador col ON os.colaborador_id = col.id;

-- Listar scripts usados com nome do equipamento
SELECT s.id, eq.nome AS equipamento, s.script, s.comentarios
FROM scripts s
JOIN equipamentos eq ON s.equipamento_id = eq.id;

🔹 JOINS ESPECÍFICOS

-- Todas as OS com scripts e equipamentos
SELECT os.id AS ordem, cli.nome AS cliente, eq.nome AS equipamento, s.script
FROM os
JOIN cliente cli ON os.cliente_id = cli.id
JOIN scripts s ON os.id = s.os_id
JOIN equipamentos eq ON s.equipamento_id = eq.id;

-- Listar contatos de um cliente específico
SELECT ct.nome, ct.telefone
FROM contato ct
WHERE ct.cliente_id = 1;

🔹 UPDATE

-- Atualizar nome de um cliente
UPDATE cliente SET nome = 'Cliente Atualizado' WHERE id = 1;

🔹 DELETE

-- Deletar uma OS
DELETE FROM os WHERE id = 1;
