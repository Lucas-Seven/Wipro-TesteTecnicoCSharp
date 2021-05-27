-- 1. Com base no modelo do banco de dados, escreva um comando SQL que liste a quantidade de processos por Status com sua descrição.
SELECT COUNT(tb_Processo.idStatus) AS qtdProcessos, tb_Status.dsStatus FROM tb_Processo
INNER JOIN tb_Status ON tb_Processo.idStatus = tb_Status.idStatus
GROUP BY tb_Processo.idStatus, tb_Status.dsStatus
ORDER BY tb_Processo.idStatus, tb_Status.

-- 2. Com base no modelo do banco de dados, construa um comando SQL que liste a maior data de andamento por número de processo, com processos encerrados no ano de 2013.
SELECT tb_Processo.nroProcesso, MAX(tb_Andamento.dtAndamento) FROM tb_Andamento
INNER JOIN tb_Processo ON tb_Andamento.idProcesso = tb_Processo.idProcesso
WHERE YEAR(tb_Processo.dtEncerramento) = 2013
GROUP BY tb_Processo.nroProcesso, tb_Andamento.dtAndamento
ORDER BY tb_Processo.nroProcesso, tb_Andamento.dtAndamento

-- 3. Com base no modelo do banco de dados, construa um comando SQL que liste a quantidade de Data de Encerramento agrupada por ela mesma onde a quantidade da contagem seja maior que 5.
SELECT COUNT(tb_Processo.dtEncerramento) AS qtdEncerramento, tb_Processo.dtEncerramento FROM tb_Processo
GROUP BY tb_Processo.dtEncerramento
HAVING COUNT(tb_Processo.dtEncerramento) > 5

-- 4. Possuímos um número de identificação do processo, onde o mesmo contém 12 caracteres com zero à esquerda, contudo nosso modelo e dados ele é apresentado como BigInt. Como fazer para apresentá-lo com 12 caracteres considerando os zeros a esquerda?
SELECT DISTINCT FORMAT(nroProcesso,'000000000000') FROM tb_Processo