create database airguard;

use airguard;

create table empresa(
	idEmpresa int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    senha varchar(45) not null
);

create table cargo(
	idCargo int primary key auto_increment,
    cargo varchar(45) not null
);

create table funcionario(
	idFuncionario int primary key auto_increment,
    nome varchar(70) not null,
    email varchar(100) not null,
    senha varchar(45) not null,
    fkEmpresa int,
    fkCargo int,
    
    foreign key (fkCargo) references cargo(idCargo),
    foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table endereco(
	idEndereco int primary key auto_increment,
    lougradouro varchar(70) not null,
    numLougradouro varchar(10),
    complemento varchar(100),
    cep char(9) not null,
    bairro varchar(100) not null,
    cidade varchar(100) not null,
    fkEmpresa int,
    
    foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table telefone(
	idTelefone int primary key auto_increment,
    nomeContato varchar(100) not null,
    numContato varchar(15) not null,
    fkFuncionario int,
    
    foreign key (fkFuncionario) references funcionario(idFuncionario)
);

create table area(
	idArea int,
    nomeArea varchar(50),
    fkEmpresa int,
    
    foreign key (fkEmpresa) references empresa(idEmpresa),
    
    primary key(idArea, fkEmpresa)
);

create table sensor(
	idSensor int primary key auto_increment,
    posicao varchar(15) not null,
    fkArea int,
    
    foreign key (fkArea) references area(idArea)
);

create table medicao(
	idMedicao int primary key auto_increment,
    presencaGas int not null,
    momento datetime not null,
    fkSensor int,
    
    foreign key (fkSensor) references sensor(idSensor)
);
