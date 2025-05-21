use air_guard;

CREATE VIEW vwUsuario AS
SELECT u.id AS id, u.nome AS NomeUsuario, u.sobrenome AS SobrenomeUsuario, u.email AS EmailUsuario, u.senha AS SenhaUsuario, u.data_cadastro AS dtCadastro, u.fkempresa AS idEmpresa, e.nome_fantasia AS NomeEmpresa
FROM usuario u
INNER JOIN empresa e ON u.fkempresa = e.id;

SELECT * from usuario;
SELECT NomeUsuario, SobrenomeUsuario, EmailUsuario, dtCadastro, NomeEmpresa, SenhaUsuario FROM vwUsuario WHERE id = 1;

SELECT
    l.data_hora AS DataHoraLeitura,
    l.concentracao_gas AS Concentracao,
    s.id AS IDSensor,
    a.nome AS NomeArea
FROM
    leitura l
INNER JOIN
    sensor s ON l.fksensor = s.id
INNER JOIN
    area a ON s.fkarea = a.id;

SELECT
    a.id AS IDAlerta,
    a.nivel_alerta AS Nivel,
    a.mensagem AS Mensagem,
    l.concentracao_gas AS ConcentracaoRegistrada,
    s.id AS IDSensor,
    ar.nome AS NomeArea,
    e.nome_fantasia AS NomeEmpresa
FROM
    alerta a
INNER JOIN
    leitura l ON a.fkleitura = l.id
INNER JOIN
    sensor s ON l.fksensor = s.id
INNER JOIN
    area ar ON s.fkarea = ar.id
INNER JOIN
    empresa e ON ar.fkempresa = e.id;


SELECT
    a.id AS ID_Alerta,
    l.data_hora AS HoraAlerta,
    a.nivel_alerta AS NivelAlerta,
    CONCAT('X:', s.eixo_x, ' Y:', s.eixo_y) AS LocalSensor,
    l.data_hora AS HoraLeituraProxima,
    l.concentracao_gas AS LeituraProxima
FROM
    alerta a
INNER JOIN
    leitura l ON a.fkleitura = l.id
INNER JOIN
    sensor s ON l.fksensor = s.id;

CREATE VIEW vw_alerta AS
SELECT
	CASE
		WHEN l.concentracao_gas < 25 THEN 'Cuidado: o nível de gás está se aproximando do limite estipulado.'
		WHEN l.concentracao_gas < 30 THEN 'Cuidado: o nível de gás está consideravelmente alto.'
		WHEN l.concentracao_gas < 39 THEN 'Cuidado: o nível de gás está no limite.'
		ELSE 'ALERTA CRÍTICO: o nível de gás ultrapassou o limite seguro!'
	END AS mensagem,
	CASE
		WHEN l.concentracao_gas < 25 THEN 'baixo'
		WHEN l.concentracao_gas < 30 THEN 'médio'
		WHEN l.concentracao_gas < 39 THEN 'alto'
		ELSE 'crítico'
	END AS nivel_alerta,
	l.id AS fkleitura
FROM leitura l
LEFT JOIN alerta a ON l.id = a.fkleitura
WHERE l.concentracao_gas > 20
AND a.fkleitura IS NULL;

select * from vw_alerta;

CREATE VIEW vw_alertaLeitura AS
	SELECT a.id as alertaId, a.mensagem as mensagem, a.nivel_alerta as nivel, l.id as leituraId, l.concentracao_gas as concentração
    from alerta a
	inner join leitura l on a.fkleitura = l.id;

select * from vw_alertaLeitura;

use air_guard;