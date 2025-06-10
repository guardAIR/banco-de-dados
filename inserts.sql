USE air_guard;

-- Inserindo empresas (matriz e filial)
INSERT INTO empresa (cnpj, nome_fantasia, razao_social, foto_perfil, data_cadastro, codigo_empresa)
VALUES	('11222333000144', 'Metais Alfa Ltda - Matriz', 'Metais Alfa Indústria e Comércio Ltda', NULL, '2023-01-15', 'MA001'),
				('55666777000188', 'Metais Alfa - Filial Forjaria', 'Metais Alfa Indústria e Comércio Ltda - Forjaria', NULL, '2023-05-20', 'MA002');

-- Inserindo endereços das empresas
INSERT INTO endereco (logradouro, numero, complemento, bairro, cidade, estado, cep, fkempresa)
VALUES	('Rua das Palmeiras', '100', 'Bloco A', 'Centro', 'São Paulo', 'SP', '01010010', 1),
				('Rua da Indústria', '1500', 'Galpão 3', 'Distrito Industrial', 'Campinas', 'SP', '13013013', 2);

-- Inserindo contatos das empresas
INSERT INTO contato (telefone, fkempresa)
VALUES	('11987654321', 1),
		('19912345678', 2);

-- Inserindo usuários vinculados a empresas
INSERT INTO usuario (nome, sobrenome, email, senha, data_cadastro, fkempresa, isADM)
VALUES	('Carlos', 'Pereira', 'carlos.pereira@metaisalfa.com', 'senhaEng789', '2023-01-16', 1),
				('Beatriz', 'Oliveira', 'beatriz.oliveira@metaisalfa.com', 'senhaTec012', '2023-05-21', 2),
				('Fernando', 'Martins', 'fernando.martins@metaisalfa.com', 'senhaSup345', '2023-02-10', 1, 1);

-- Inserindo áreas nas empresas
INSERT INTO area (nome, foto_perfil, fkempresa)
VALUES	('Área de Fundição', NULL, 1),
				('Laboratório Metalúrgico', NULL, 1),
				('Setor de Laminação', NULL, 2),
				('Pátio de Matéria Prima', NULL, 2);

-- Inserindo sensores nas áreas
-- Inserindo sensores nas áreas
INSERT INTO sensor (eixo_x, eixo_y, fkarea)
VALUES	(200, 100, 1),
				(500, 100, 1),
				(200, 300, 1),
				(500, 300, 1),
				(200, 100, 2),
				(500, 100, 2),
				(200, 300, 2),
				(500, 300, 2),
				(200, 100, 3),
				(500, 100, 3),
				(200, 300, 3),
				(500, 300, 3),
				(200, 100, 4),
				(500, 100, 4),
				(200, 300, 4),
				(500, 300, 4);