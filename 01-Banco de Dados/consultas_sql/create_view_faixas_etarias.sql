CREATE VIEW view_faixas_etarias AS

SELECT 0 de, 11 ate, 'crianca' faixa_etaria
UNION
SELECT 12 de, 17 ate, 'adolescente' faixa_etaria
UNION
SELECT 18 de, 29 ate, 'jovem' faixa_etaria
UNION
SELECT 30 de, 59 ate, 'adulto' faixa_etaria
UNION
SELECT 60 de, 130 ate, 'idoso' faixa_etaria

ORDER	BY de
