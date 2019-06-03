DROP TYPE TP_Cliente Force;
DROP TYPE TP_Compra FORCE;
DROP TYPE TP_Curriculo FORCE;
DROP TYPE TP_Dependente FORCE;
DROP TYPE TP_Editora FORCE;
DROP TYPE TP_Empregado FORCE;
DROP TYPE TP_End FORCE;
DROP TYPE TP_Garantia FORCE;
DROP TYPE TP_Livro FORCE;
DROP TYPE TP_Tel_Editora FORCE;
DROP TYPE TP_Pessoa FORCE;
DROP TYPE TP_Tel_Pessoa FORCE;


CREATE OR REPLACE TYPE TP_End AS OBJECT (

	cep VARCHAR2(10),
	descriacao VARCHAR2(30)

) FINAL;
/

create or replace type TP_Curriculo as object (

    curriculo_id number,
    historico VARCHAR2(50),
    escolaridade VARCHAR2(50)

)FINAL;
/

create or replace type TP_Pessoa as object (

        cpf VARCHAR2(9),
        nome Varchar2(50),
        endereco  TP_End 


) NOT FINAL;
/

create or replace type TP_Tel_Pessoa as object(

        ref_cpf REF TP_Pessoa,
        telefone_pessoa VARCHAR2(50)

) FINAL;
/

create or replace type TP_Cliente UNDER TP_Pessoa (

        data_de_cadastro DATE

)FINAL;
/

create or replace type TP_Dependente as object(

        cpf_dependente VARCHAR2(9),
        ref_cpf_titular REF TP_Cliente,
        nome_dependente VARCHAR2(50),
        idade_dependente number


)FINAL;
/


create or replace type TP_Empregado UNDER TP_Pessoa(

            salario number,
            data_de_contratacao DATE,
            curriculo_emp_id TP_Curriculo,
            ref_chefe REF TP_Empregado
)FINAL;
/

create or replace type TP_Editora as object (

        cnpj VARCHAR2(50),
        nome VARCHAR2(50)


)FINAL;
/

create or replace type TP_Tel_Editora as object(

        ref_cnpj REF TP_Editora,
        telefone_editora VARCHAR2(50)

) FINAL;
/

create or replace type TP_Livro as object (

        id_livro NUMBER,
        nome VARCHAR2(50),
        ref_cnpj REF TP_Editora


)FINAL;
/

create or replace type TP_Garantia as object (

        id_garantia NUMBER,
        tempo_garantia NUMBER ,
        data_garantia DATE ,
        ref_id_livro REF TP_Livro

)FINAL;
/

create or replace type TP_Compra as object (

        valor NUMBER,
        data_compra DATE,
        ref_cpf_empregado REF TP_Empregado,
        ref_compra_cpf_cliente REF TP_Cliente,
        ref_compra_id_livro REF TP_Livro

)FINAL;
/
