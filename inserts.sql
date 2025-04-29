USE airguard;

INSERT INTO endereco (endereco, numero, complemento, bairro, cidade, estado, cep) VALUES
('Rua das Palmeiras', '100', 'Bloco A', 'Centro', 'São Paulo', 'SP', '01010010'),
('Rua da Indústria', '1500', 'Galpão 3', 'Distrito Industrial', 'Campinas', 'SP', '13013013'),
('Travessa dos Ventos', '50', 'Casa 2', 'Vila Mariana', 'São Paulo', 'SP', '04040040'),
('Rua das Flores', '55', 'Apto 3B', 'Liberdade', 'São Paulo', 'SP', '01501001'),
('Alameda dos Sabiás', '789', NULL, 'Taquaral', 'Campinas', 'SP', '13076001');

INSERT INTO cargo (nome_cargo) VALUES
('Engenheiro Metalurgista'),
('Técnico de Segurança Trab.'),
('Supervisor de Produção'),
('Operador de Forno');

INSERT INTO empresa (nome, cnpj, email, senha, data_cadastro, fkEndereco, fkEmpresaMatriz) VALUES
('Metais Alfa Ltda - Matriz', '11222333000144', 'contato@metaisalfa.com', 'senhaMatriz123', '2023-01-15', 1, NULL),
('Metais Alfa - Filial Forjaria', '55666777000188', 'forjaria.cps@metaisalfa.com', 'senhaFilial456', '2023-05-20', 2, 1);

INSERT INTO contatoEmpresa (nome_contato, numero_contato, fkEmpresa) VALUES
('Ana Souza - Eng. Metalurgista', '11987654321', 1),
('Roberto Lima - Téc. Segurança', '19912345678', 2);

INSERT INTO usuario (nome, sobrenome, cpf, email, telefone, fkEmpresa, fkCargo, fkEndereco) VALUES
('Carlos', 'Pereira', '11122233344', 'carlos.pereira@metaisalfa.com', '11999998888', 1, 1, 4),
('Beatriz', 'Oliveira', '55566677788', 'beatriz.oliveira@metaisalfa.com', '19977776666', 2, 2, 5),
('Fernando', 'Martins', '99988877766', 'fernando.martins@metaisalfa.com', '11955554444', 1, 3, 3);

INSERT INTO credenciais (usuario_login, senha, data_criacao, fkUsuario) VALUES
('carlos.eng', 'senhaEng789', '2023-01-16', 1),
('bia.seg', 'senhaTec012', '2023-05-21', 2),
('fer.sup', 'senhaSup345', '2023-02-10', 3);

INSERT INTO areas (nome_area, fkEmpresa) VALUES
('Área de Fundição', 1),
('Laboratório Metalúrgico', 1),
('Setor de Laminação', 2),
('Pátio de Matéria Prima', 2);

INSERT INTO sensor (localizacao, status_sensor, fkAreas) VALUES
('Próximo ao Forno A1', 'ativo', 1),
('Bancada Análise Espectral', 'ativo', 2),
('Zona de Resfriamento Pós-Laminação', 'ativo', 3),
('Empilhadeira de Sucata MP-05', 'ativo', 4);

SELECT * FROM endereco;
SELECT * FROM cargo;
SELECT * FROM empresa;
SELECT * FROM contatoEmpresa;
SELECT * FROM usuario;
SELECT * FROM credenciais;
SELECT * FROM areas;
SELECT * FROM sensor;