-- CONSULTAS


-- 1. Criação de tipo e subtipo - Marton
-- 2. Criação de um tipo que contenha um atributo que seja de um outro tipo - Marton

CREATE OR REPLACE TYPE tp_Periodico AS OBJECT (
	nome		VARCHAR2(200),
	edicao		NUMBER,
	dt_lancamento	DATE
) NOT FINAL;

CREATE OR REPLACE TYPE tp_Revista UNDER tp_Periodico (
	editora		VARCHAR2(200),
	tel_editora     TP_Fone,
	conteudo	VARCHAR2(200)
) FINAL;


-- 3. Criação de um tipo que contenha um atributo que seja de um tipo VARRAY - Marton

CREATE OR REPLACE TYPE tp_va_Periodicos AS VARRAY(5) OF tp_Periodico;


-- 4. Criação de um tipo que contenha um atributo que seja de um tipo NESTED TABLE - ADRIANO
-- P.S ESTE TIPO FOI CRIADO NA TABELA DE CRIACAO de TIPOS
create or replace type TP_Fone as object(

        telefone VARCHAR2(50)

) FINAL;
/

create or replace type TP_Tel as TABLE of TP_Fone;
/

-- 5. Criação e chamada de um método construtor (diferente do padrão) - Adriano
DROP TP_Curriculo FORCE;

create or replace type TP_Curriculo as object (

    curriculo_id number,
    historico VARCHAR2(50),
    escolaridade VARCHAR2(50),
    CONSTRUCTOR FUNCTION TP_Curriculo (id_curr number) RETURN SELF AS RESULT
 
)FINAL;
/
-- 6. Criação e chamada de um função membro em um comando SELECT e em um bloco PL 
-- 7. Criação e chamada de um método MAP em um comando SELECT e em um bloco PL
-- 8. Criação e chamada de um método ORDER em um comando SELECT e em um bloco PL
-- 9. Criação e chamada de método abstrato
-- 10. Redefinição de método do supertipo dentro do subtipo

-- 11. Alteração de tipo: adição de atributo - ADRIANO
--- Foi criado um atributo genero ao tipo livro
ALTER TYPE TP_Livro ADD ATTRIBUTE (genero Varchar2(50)) cascade;

-- 12. Alteração de tipo: modificação de atributo - ADRIANO
--- Foi alterado o atributo genero , diminuido o Tamanho q ele pode ter
ALTER TYPE TP_Livro MODIFY ATTRIBUTE genero Varchar2(10);

-- 13. Alteração de tipo: remoção de atributo - ADRIANO
-- Atributo genero foi remoido
ALTER TYPE TP_Livro DROP ATTRIBUTE (genero) CASCADE;

-- 14. Alteração de supertipo com propagação de mudança
-- 15. Alteração de supertipo com invalidação de subtipos afetados
-- 16. Uso de referência e controle de integridade referencial
-- 17. Restrição de escopo de referência
-- 18. Criação de todas as tabela a partir de um tipo

-- 19. Criação de uma consulta com expressão de caminho parapercorrer três tabelas - ADRIANO
-- não possuímos 3 tabelas aninhados com ref então usamos apenas 2
SELECT distinct c.ref_cpf_empregado.ref_curriculo_emp.curriculo_id from TB_Compra c;
-- 20  Criação de uma consulta com DEREF E USO DE LIKE , BETWEEN E ORDER BY - ADRIANO
-- seleciona o objeto referenciado por ref_cnpj que é editora e atendem as restrições.
SELECT DEREF(l.ref_cnpj) from TB_Livro l where ((l.nome like 'Li%') and (l.id_livro BETWEEN 0200 and 0400)) ORDER BY l.id_livro;
-- 21. Criação de uma consulta com VALUE - ADRIANO
SELECT VALUE(D) from TB_Dependente D;
-- 22. Criação de uma consulta com TABLE
-- 23. Criação de consultas com  GROUP BY HAVING
-- 24. Criação de subconsultas com IN , ALL, ANY
-- 25. Criação de uma consulta que exiba os dados de um VARRAY
-- 26. Criação de uma consulta que exiba os dados de um NESTED TABLE
-- 27. SELECT para acessar os dados de uma tabela A utilizando uma tabela B dentro da cláusula EXISTS, onde a tabela A tem uma referencia para a tabela B.
-- 28. Criação de TRIGGER de linha ao ocorrer um INSERT, DELETE ou UPDATE
-- 29. Criação de TRIGGER de linha para impedir INSERT, DELETE ou UPDATE
-- 30. Criação de TRIGGER de comando para impedir INSERT, DELETE ou UPDATE


---------------- FEITAS ------------------------------
-- 1 ,  2 , 3 , 4 , 5 , 11 , 12 , 13 , 19 , 20 , 21