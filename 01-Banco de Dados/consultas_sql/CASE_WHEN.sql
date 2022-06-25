SELECT caso, data_nascimento, idade,

CASE
	WHEN idade < 12 then 'Criança'
	WHEN idade BETWEEN 12 AND 17 then 'Adolescente'
	WHEN idade BETWEEN 18 AND 29 then 'Jovem'
	WHEN idade BETWEEN 30 AND 59 then 'Adulto'
	WHEN idade > 60 then 'Idoso'
END AS faixa_etaria



FROM view_ocorrencias LIMIT 50