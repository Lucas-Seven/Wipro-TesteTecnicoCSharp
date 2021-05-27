-- 1. Com base no modelo do banco de dados, escreva um comando SQL que liste a quantidade de processos por Status com sua descrição.
SELECT COUNT(tb_Processo.idStatus) AS qtdProcessos, tb_Status.dsStatus FROM tb_Processo
INNER JOIN tb_Status ON tb_Processo.idStatus = tb_Status.idStatus
GROUP BY tb_Processo.idStatus, tb_Status.dsStatus
ORDER BY tb_Processo.idStatus, tb_Status.dsStatus