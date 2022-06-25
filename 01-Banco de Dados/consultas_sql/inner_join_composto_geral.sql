SELECT 

ocorrencia.id AS caso, 
estado.nome AS estado,
estado.id AS uf,
cidade.nome AS cidade,
bairro.nome AS bairro,
rua.nome AS rua,
pessoa.data_nascimento,
ocorrencia.data_ocorrencia

FROM ocorrencia

INNER JOIN pessoa ON ocorrencia.pessoa_id = pessoa.id

INNER JOIN cep ON pessoa.cep_id = cep.id

INNER JOIN estado ON cep.estado_id = estado.id

INNER JOIN cidade ON cep.cidade_id = cidade.id

INNER JOIN bairro ON cep.bairro_id = bairro.id

INNER JOIN rua ON cep.rua_id = rua.id

ORDER BY ocorrencia.id

LIMIT 10;