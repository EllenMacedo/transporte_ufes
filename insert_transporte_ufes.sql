INSERT INTO usuario (idUsuario, nome, email, senha, tipo, matricula, telefone) VALUES
(1, 'Administrador', 'admin@ufes.br', 'root', 'admin', '20220001', '28999999999'),
(2, 'Maria Oliveira', 'maria.oliveira@ufes.br', 'senha456', 'aluno', '20220002', '28988888888'),
(3, 'Carlos Pereira', 'carlos.pereira@ufes.br', 'senha789', 'motorista', '00000001', '28977777777'),
(4, 'Ana Costa', 'ana.costa@ufes.br', 'senha1234', 'aluno', '20220003', '28966666666'),
(5, 'Lucas Santos', 'lucas.santos@ufes.br', 'senha5678', 'admin', '00000002', '28955555555'),
(6, 'Fernanda Rocha', 'fernanda.rocha@ufes.br', 'senha910', 'aluno', '20220004', '27944444444'),
(7, 'Pedro Souza', 'pedro.souza@ufes.br', 'senha111', 'aluno', '20220005', '28933333333'),
(8, 'Juliana Almeida', 'juliana.almeida@ufes.br', 'senha222', 'admin', '00000003', '28922222222'),
(9, 'Roberto Lima', 'roberto.lima@ufes.br', 'senha333', 'motorista', '00000004', '28911111111'),
(10, 'Patrícia Gomes', 'patricia.gomes@ufes.br', 'senha444', 'admin', '00000005', '28900000000');


INSERT INTO veiculo (idVeiculo, placa, modelo, capacidade, status, idMotorista) VALUES
(1, 'ABD1234', 'Ônibus 1', 40, 'ativo', 3),
(2, 'DEF5678', 'Ônibus 2', 45, 'ativo', 9), 
(3, 'GHI9101', 'Ônibus 3', 50, 'ativo', 3),
(4, 'JKL1122', 'Micro-ônibus 1', 20, 'ativo', 9),
(5, 'MNO3344', 'Micro-ônibus 2', 20, 'ativo', 3),
(6, 'PQR5566', 'Van 1', 15, 'ativo', 9),
(7, 'STU7788', 'Van 2', 15, 'manutencao', 3),
(8, 'VWX9900', 'Ônibus 4', 40, 'ativo', 9),
(9, 'YZA2233', 'Ônibus 5', 40, 'inativo', 3),
(10, 'BCD4455', 'Van 3', 15, 'ativo', 9);


INSERT INTO cidade (idCidade, nome, uf) VALUES
(1, 'Alegre', 'ES'),
(2, 'Guaçuí', 'ES'),
(3, 'São José do Calçado', 'ES'),
(4, 'Ibitirama', 'ES'),
(5, 'Cachoeiro de Itapemirim', 'ES'),
(6, 'Muqui', 'ES'),
(7, 'Ibatiba', 'ES'),
(8, 'Anutiba', 'ES'),
(9, 'Divino de São Lourenço', 'ES'),
(10, 'Jerônimo Monteiro', 'ES');

INSERT INTO rota (idRota, idCidadeOrigem, idCidadeDestino, duracaoEstimada, direcao) VALUES
(1, 1, 2, '00:50:00', 'ida'), 
(2, 2, 1, '00:50:00', 'volta'),  
(3, 1, 5, '01:15:00', 'ida'), 
(4, 5, 1, '01:15:00', 'volta'),
(5, 1, 3, '01:10:00', 'ida'),  
(6, 3, 1, '01:10:00', 'volta'), 
(7, 1, 4, '01:20:00', 'ida'), 
(8, 4, 1, '01:20:00', 'volta'),
(9, 1, 6, '01:00:00', 'ida'),
(10, 6, 1, '01:00:00', 'volta'); 

INSERT INTO rota_cidade (idRotaCidade, idRota, idCidade, ordem) VALUES
(1, 1, 1, 1), 
(2, 1, 10, 2),
(3, 1, 2, 3), 
(4, 3, 1, 1),  
(5, 3, 6, 2), 
(6, 3, 5, 3); 


INSERT INTO viagem (idViagem, idVeiculo, idMotorista, idRota, datas, hora, vagasDisponiveis, status) VALUES
(1, 1, 3, 1, '2025-03-02', '06:30:00', 25, 'agendada'),
(2, 2, 9, 2, '2025-03-02', '18:00:00', 40, 'agendada'), 
(3, 3, 3, 3, '2025-03-02', '07:00:00', 35, 'agendada'), 
(4, 4, 9, 4, '2025-03-02', '17:30:00', 30, 'agendada'), 
(5, 5, 3, 5, '2025-03-02', '08:00:00', 20, 'agendada'),
(6, 6, 9, 6, '2025-03-02', '16:30:00', 25, 'agendada');


INSERT INTO reserva (idReserva, idUsuario, idViagem, status) VALUES
(1, 1, 1, 'confirmada'),
(2, 2, 2, 'pendente'),
(3, 3, 3, 'cancelada'),
(4, 4, 4, 'confirmada'),
(5, 5, 5, 'pendente'),
(6, 6, 6, 'confirmada');

INSERT INTO pagamento (idPagamento, idUsuario, valor, dataPagamento, metodo, status) VALUES
(1, 1, 50.00, '2025-02-20', 'pix', 'pago'),
(2, 2, 30.00, '2025-02-20', 'cartao', 'pendente'),
(3, 3, 100.00, '2025-02-21', 'dinheiro', 'pago'),
(4, 4, 60.00, '2025-02-21', 'pix', 'cancelado'),
(5, 5, 45.00, '2025-02-22', 'cartao', 'pago'),
(6, 6, 80.00, '2025-02-22', 'dinheiro', 'pago'),
(7, 7, 50.00, '2025-02-23', 'pix', 'pago'),
(8, 8, 35.00, '2025-02-23', 'cartao', 'pendente'),
(9, 9, 70.00, '2025-02-24', 'dinheiro', 'cancelado'),
(10, 10, 55.00, '2025-02-24', 'pix', 'pago');
