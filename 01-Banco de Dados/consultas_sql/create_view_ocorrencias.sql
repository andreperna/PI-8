CREATE VIEW view_ocorrencias AS

SELECT 

ocorrencia.id AS caso, 
estado.nome AS estado,
estado.uf AS uf,
cidade.nome AS cidade,
bairro.nome AS bairro,
rua.nome AS rua,
pessoa.data_nascimento,
ocorrencia.data_ocorrencia,
TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, CURDATE()) AS idade,
CASE
	WHEN TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, CURDATE()) < 12 then 'Criança'
	WHEN TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, CURDATE()) BETWEEN 12 AND 17 then 'Adolescente'
	WHEN TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, CURDATE()) BETWEEN 18 AND 29 then 'Jovem'
	WHEN TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, CURDATE()) BETWEEN 30 AND 59 then 'Adulto'
	WHEN TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, CURDATE()) BETWEEN 60 AND 130 then 'Idoso'
END AS faixa_etaria


FROM ocorrencia

INNER JOIN pessoa ON ocorrencia.pessoa_id = pessoa.id

INNER JOIN cep ON pessoa.cep_id = cep.id

INNER JOIN estado ON cep.estado_id = estado.id

INNER JOIN cidade ON cep.cidade_id = cidade.id

INNER JOIN bairro ON cep.bairro_id = bairro.id

INNER JOIN rua ON cep.rua_id = rua.id

ORDER BY ocorrencia.id
