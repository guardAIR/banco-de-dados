SELECT
    ls.data_hora AS DataHoraLeitura,
    ls.concentracao_gas AS Concentracao,
    s.localizacao AS LocalizacaoSensor,
    a.nome_area AS NomeArea
FROM
    LeituraSensor ls
INNER JOIN
    sensor s ON ls.fkSensor = s.id
INNER JOIN
    areas a ON s.fkAreas = a.id;
    
    
    
SELECT
    al.data_hora AS DataHoraAlerta,
    al.nivel_alerta AS Nivel,
    al.concentracao_gas AS ConcentracaoRegistrada,
    al.mensagem_alerta AS Mensagem,
    s.localizacao AS LocalizacaoSensor,
    a.nome_area AS NomeArea,
    e.nome AS NomeEmpresa
FROM
    alerta al
INNER JOIN
    sensor s ON al.fkSensor = s.id
INNER JOIN
    areas a ON s.fkAreas = a.id
INNER JOIN
    empresa e ON a.fkEmpresa = e.id;
    
    
    
SELECT
    u.nome AS NomeUsuario,
    u.sobrenome AS SobrenomeUsuario,
    u.email AS EmailUsuario,
    c.nome_cargo AS Cargo,
    e.nome AS NomeEmpresa
FROM
    usuario u
INNER JOIN
    cargo c ON u.fkCargo = c.id
INNER JOIN
    empresa e ON u.fkEmpresa = e.id;
    
    
SELECT
    s.id AS ID_Sensor,
    s.localizacao AS Localizacao,
    a.nome_area AS Area,
    e.nome AS Empresa
FROM
    sensor s
INNER JOIN
    areas a ON s.fkAreas = a.id
INNER JOIN
    empresa e ON a.fkEmpresa = e.id
WHERE
    s.status_sensor = 'ativo';
    


SELECT
    al.id AS ID_Alerta,
    al.data_hora AS HoraAlerta,
    al.nivel_alerta AS NivelAlerta,
    s.localizacao AS LocalSensor,
    ls.data_hora AS HoraLeituraProxima,
    ls.concentracao_gas AS LeituraProxima
FROM
    alerta al
INNER JOIN
    sensor s ON al.fkSensor = s.id
LEFT JOIN
    leituraSensor ls ON al.fkSensor = ls.fkSensor;