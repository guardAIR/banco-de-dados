-- criando e usando database
create database airguard;
use airguard;

-- criação das tabelas

create table endereco (
	id					int primary key auto_increment,
	logradouro			varchar(10) not null,
    endereco			varchar(200) not null,
    numero				varchar(50) not null,
    complemento			varchar(50) not null,
    bairro				varchar(100) not null,
    cidade				varchar(50) not null,
    estado				varchar(2) not null,
    cep					varchar(8) not null
);

create table empresa (
	id					int primary key auto_increment,
    nome				varchar(50) not null,
    nome_fantasia		varchar(100),
	tipo_empresa		varchar(7) not null,
    cnpj				varchar(14) not null,
    telefone			varchar(13) not null,
    email				varchar(200) not null,
    data_cadastro		datetime default current_timestamp,
    fkEndereco			int,
    fkEmpresa_matriz	int,
    constraint uc_empresa unique (cnpj, email),
    constraint chk_tipo_empresa check (tipo_empresa in ('pequena', 'média', 'grande'))
);

create table contatoEmpresa (
	id					int primary key auto_increment,
    nome_contato		varchar(100),
    numero_contato		varchar(15),
    fkEmpresa			int
);

create table usuario (
	id					int primary key auto_increment,
    nome				varchar(50) not null,
    sobrenome			varchar(50) not null,
	cpf					varchar(11) not null,
    email				varchar(200) not null,	
    telefone			varchar(13) not null,
    fkEmpresa			int,
    fkCargo				int,
    fkEndereco			int,
    constraint uc_usuario unique (cpf, email)
);

create table cargo (
	id					int primary key auto_increment,
    nome_cargo			varchar(100)
);

create table credenciais (
	id					int primary key auto_increment,
    usuario_login		varchar(50) not null,
    senha				varchar(50) not null,
    data_criacao		datetime default current_timestamp,
    fkUsuario			int,
    constraint uc_credenciais unique (usuario_login, senha)
);

create table areas (
	id					int primary key auto_increment,
    nome_area			varchar(100),
    fkEmpresa			int
);

create table sensor (
	id					int primary key auto_increment,
    localizacao			varchar(100) not null,
    status_sensor		varchar(50) not null,
	limite_seguro		float not null,
    fkAreas				int,
    constraint chk_status_sensor check (status_sensor in ('inativo', 'manutenção', 'ativo'))
);

create table leituraSensor (
	id					int primary key auto_increment,
    concentracao_gas	float not null,
    data_hora			datetime default current_timestamp,
    fkSensor			int
);

/*create table alerta (
	id					int primary key auto_increment,
    concentracao_gas	float not null,
    data_hora			datetime default current_timestamp,
    nivel_alerta		varchar(7) not null,
    mensagem_alerta		varchar(200),
    fkleituraSensor		int,
    constraint chk_nivel_alerta check (nivel_alerta in ('baixo', 'médio', 'alto', 'crítico'))
);*/

-- criando relação entre tabelas (foreign keys)

alter table empresa
add constraint fk_endereco_empresa
foreign key (fkEndereco) references endereco(id);

alter table empresa
add constraint fk_matriz_empresa
foreign key (fkEmpresa_matriz) references empresa(id);

alter table empresa
add constraint fk_endereco_empresa_dois
foreign key (fkEndereco) references endereco(id);

alter table usuario
add constraint fk_empresa_usuario
foreign key (fkEmpresa) references empresa(id);

alter table usuario
add constraint fk_endereco_usuario
foreign key (fkEndereco) references endereco(id);

alter table usuario
add constraint fk_cargo_usuario
foreign key (fkCargo) references cargo(id);

alter table credenciais
add constraint fk_usuario_credenciais
foreign key (fkUsuario) references usuario(id);

alter table areas
add constraint fk_empresa_areas
foreign key (fkEmpresa) references empresa(id);

alter table sensor
add constraint fk_areas_sensor
foreign key (fkAreas) references areas(id);

alter table leituraSensor
add constraint fk_sensor_leituraSensor
foreign key (fkSensor) references sensor(id);

/*alter table alerta
add constraint fk_leituraSensor_alerta
foreign key (fkleituraSensor) references leituraSensor(id);*/


/*Inserindo dados nas tabelas*/

-- endereco empresa
INSERT INTO endereco (logradouro, endereco, numero, complemento, bairro, cidade, estado, cep)
VALUES ('Rua', 'das Indústrias', '123', 'Bloco A', 'Distrito Industrial', 'Joinville', 'SC', '89219600');

-- endereco funcionario
INSERT INTO endereco (logradouro, endereco, numero, complemento, bairro, cidade, estado, cep)
VALUES ('Avenida', 'dos Trabalhadores', '456', 'Apto 101', 'Centro', 'Joinville', 'SC', '89201000');

INSERT INTO empresa (nome, nome_fantasia, tipo_empresa, cnpj, telefone, email, fkEndereco, fkEmpresa_matriz)
VALUES ('TecnoIndustrial Ltda', 'TecnoIndustrial Soluções', 'média', '12345678000199', '4733334444', 'contato@tecnoindustrial.com', 1, NULL);

INSERT INTO contatoEmpresa (nome_contato, numero_contato, fkEmpresa)
VALUES ('Maria Silva (Compras)', '47988887777', 1);

INSERT INTO cargo (nome_cargo) 
VALUES ('Técnico de Segurança');

INSERT INTO usuario (nome, sobrenome, cpf, email, telefone, fkEmpresa, fkCargo, fkEndereco)
VALUES ('João', 'Pereira', '11122233344', 'joao.pereira@tecnoindustrial.com', '47999998888', 1, 1, 2);

INSERT INTO areas (nome_area, fkEmpresa)
VALUES ('Produção Setor A', 1);

INSERT INTO sensor (localizacao, status_sensor, limite_seguro, fkAreas)
VALUES ('Próximo à máquina M-05', 'ativo', 50.0, 1);


SELECT
    -- Seleciona colunas relevantes de cada tabela, usando aliases para clareza
    e.id AS id_empresa,
    e.nome AS nome_empresa,
    e.cnpj,
    a.id AS id_area,
    a.nome_area,
    s.id AS id_sensor,
    s.localizacao AS localizacao_sensor,
    s.status_sensor,
    l.id AS id_leitura,
    l.concentracao_gas,
    l.data_hora AS data_hora_leitura
FROM
    empresa e 
JOIN
    areas a ON e.id = a.fkEmpresa 
JOIN
    sensor s ON a.id = s.fkAreas 
JOIN
    leituraSensor l ON s.id = l.fkSensor;
    
    
    select * from leituraSensor;
    
    truncate leituraSensor;
