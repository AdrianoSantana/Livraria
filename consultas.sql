-- CONSULTAS


-- 1. Criação de tipo e subtipo - Marton

CREATE OR REPLACE TYPE tp_Periodico AS OBJECT (
	nome			VARCHAR2(200),
	edicao			NUMBER,
	dt_lancamento	DATE
) NOT FINAL;

CREATE OR REPLACE TYPE tp_Revista UNDER tp_Periodico (
	editora			VARCHAR2(200),
	conteudo		VARCHAR2(200)
) FINAL;


-- 2. Criação de um tipo que contenha um atributo que seja de um outro tipo
-- 3. Criação de um tipo que contenha um atributo que seja de um tipo VARRAY
-- 4. Criação de um tipo que contenha um atributo que seja de um tipo NESTED TABLE
-- 5. Criação e chamada de um método construtor (diferente do padrão)
-- 6. Criação e chamada de um função membro em um comando SELECT e em um bloco PL
-- 7. Criação e chamada de um método MAP em um comando SELECT e em um bloco PL
-- 8. Criação e chamada de um método ORDER em um comando SELECT e em um bloco PL
-- 9. Criação e chamada de método abstrato
-- 10. Redefinição de método do supertipo dentro do subtipo
-- 11. Alteração de tipo: adição de atributo
-- 12. Alteração de tipo: modificação de atributo
-- 13. Alteração de tipo: remoção de atributo
-- 14. Alteração de supertipo com propagação de mudança
-- 15. Alteração de supertipo com invalidação de subtipos afetados
-- 16. Uso de referência e controle de integridade referencial
-- 17. Restrição de escopo de referência
-- 18. Criação de todas as tabela a partir de um tipo
-- 19. Criação de uma consulta com expressão de caminho parapercorrer três tabelas
-- 20. Criação de uma consulta com DEREF
-- 21. Criação de uma consulta com VALUE
-- 22. Criação de uma consulta com TABLE
-- 23. Criação de consultas com LIKE, BETWEEN, ORDER BY, GROUP BY, HAVING
-- 24. Criação de subconsultas com IN , ALL, ANY,
-- 25. Criação de uma consulta que exiba os dados de um VARRAY
-- 26. Criação de uma consulta que exiba os dados de um NESTED TABLE
-- 27. SELECT para acessar os dados de uma tabela A utilizando uma tabela B dentro da cláusula EXISTS, onde a tabela A tem uma referencia para a tabela B.
-- 28. Criação de TRIGGER de linha ao ocorrer um INSERT, DELETEou UPDATE
-- 29. Criação de TRIGGER de linha para impedir INSERT, DELETEou UPDATE
-- 30. Criação de TRIGGER de comando para impedir INSERT, DELETEou UPDATE
