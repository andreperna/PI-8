#SELECT faixa_etaria, COUNT(*) FROM test.view_ocorrencias WHERE estado = 'São Paulo' AND cidade = 'Americana' GROUP BY faixa_etaria

SELECT faixa_etaria, COUNT(*) as qtd FROM test.view_ocorrencias WHERE estado = 'São Paulo' GROUP BY faixa_etaria