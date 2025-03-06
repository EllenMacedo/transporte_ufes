create database transporte_ufes;
use transporte_ufes;

create table usuario
(
	idUsuario INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    matricula VARCHAR(20) UNIQUE,
    telefone VARCHAR(15) NULL,
	CONSTRAINT pkUsuario PRIMARY KEY (idUsuario)
);

CREATE TABLE veiculo (
    idVeiculo INTEGER AUTO_INCREMENT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    capacidade INT NOT NULL,
    status VARCHAR(20) DEFAULT 'ativo',
    idMotorista INTEGER, 
    CONSTRAINT pkVeiculo PRIMARY KEY (idVeiculo),
    CONSTRAINT fkVeiculoMotorista FOREIGN KEY (idMotorista)
        REFERENCES usuario(idUsuario)
);

CREATE TABLE cidade (
	idCidade INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	uf CHAR(2) NOT NULL,
	CONSTRAINT pkCidade PRIMARY KEY (idCidade)
);

CREATE TABLE rota (
    idRota INTEGER AUTO_INCREMENT NOT NULL,
    idCidadeOrigem INTEGER NOT NULL,
    idCidadeDestino INTEGER NOT NULL,
    duracaoEstimada TIME NOT NULL,
    direcao VARCHAR(20) NOT NULL,
    CONSTRAINT pkRota PRIMARY KEY (idRota),
    CONSTRAINT fkRotaCidadeOrigem FOREIGN KEY (idCidadeOrigem)
        REFERENCES cidade(idCidade),
    CONSTRAINT fkRotaCidadeDestino FOREIGN KEY (idCidadeDestino)
        REFERENCES cidade(idCidade)
);

CREATE TABLE rota_cidade (
    idRotaCidade INTEGER AUTO_INCREMENT  NOT NULL,
    idRota INTEGER NOT NULL,
    idCidade INTEGER NOT NULL,
    ordem INTEGER NOT NULL,
    CONSTRAINT pkRotaCidade PRIMARY KEY (idRotaCidade),
    CONSTRAINT fkRotaCidadeRota FOREIGN KEY (idRota)
        REFERENCES rota(idRota),
    CONSTRAINT fkRotaCidadeCidade FOREIGN KEY (idCidade)
        REFERENCES cidade(idCidade)
);


CREATE TABLE viagem (
    idViagem INTEGER AUTO_INCREMENT NOT NULL,
    idVeiculo INTEGER,
    idMotorista INTEGER,
    idRota INTEGER,
    datas DATE NOT NULL,
	hora TIME NOT NULL,
    vagasDisponiveis INTEGER NOT NULL,
    status VARCHAR(20) DEFAULT 'agendada',
	CONSTRAINT pkViagem PRIMARY KEY (idViagem),
	CONSTRAINT fkViagemVeiculo FOREIGN KEY (idVeiculo)
		REFERENCES veiculo(idVeiculo),
	CONSTRAINT fkViagemMotorista FOREIGN KEY (idMotorista)
		REFERENCES usuario(idUsuario),
	CONSTRAINT fkViagemRota FOREIGN KEY (idRota)
		REFERENCES rota(idRota)
);

CREATE TABLE reserva (
    idReserva INT AUTO_INCREMENT NOT NULL,
    idUsuario INT,
    idViagem INT,
    status VARCHAR(20) DEFAULT 'pendente',
	CONSTRAINT pkReserva PRIMARY KEY (idReserva),
	CONSTRAINT fkReservaUsuario FOREIGN KEY (idUsuario)
		REFERENCES usuario(idUsuario),
	CONSTRAINT fkReservaViagem FOREIGN KEY (idViagem)
		REFERENCES viagem(idViagem)
);

CREATE TABLE pagamento (
    idPagamento INT AUTO_INCREMENT NOT NULL,
    idUsuario INT ,
    valor DECIMAL(10,2) NOT NULL,
    dataPagamento DATE NOT NULL,
    metodo VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'pendente',
    CONSTRAINT pkPagamento PRIMARY KEY (idPagamento),
	CONSTRAINT fkPagamentoUsuario FOREIGN KEY (idUsuario)
		REFERENCES usuario(idUsuario)
);
