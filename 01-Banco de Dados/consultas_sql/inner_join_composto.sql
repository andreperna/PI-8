SELECT

cep.id AS cep,
cep.estado_id AS estado,
bairro.nome AS bairro,
rua.nome AS rua

FROM cep

INNER JOIN bairro
ON cep.bairro_id = bairro.id

INNER JOIN rua
ON cep.rua_id = rua.id

WHERE cep.id > 14161324

LIMIT 10;