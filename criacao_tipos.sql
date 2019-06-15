DROP TYPE TP_Cliente Force;
DROP TYPE TP_Compra FORCE;
DROP TYPE TP_Curriculo FORCE;
DROP TYPE TP_Dependente FORCE;
DROP TYPE TP_Editora FORCE;
DROP TYPE TP_Empregado FORCE;
DROP TYPE TP_End FORCE;
DROP TYPE TP_Garantia FORCE;
DROP TYPE TP_Livro FORCE;
DROP TYPE TP_Fone FORCE;
DROP TYPE TP_Tel FORCE;
DROP TYPE TP_Pessoa FORCE;
DROP TYPE TP_Redes FORCE;


create or replace type TP_Fone as object(

        telefone VARCHAR2(50)

) FINAL;
/

create or replace type TP_Redes as varray(3) of Varchar2(30);
/

create or replace type TP_Tel as TABLE of TP_Fone;
/


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


        nome Varchar2(50),
        endereco  TP_End,
        telefone_pessoa TP_Tel


) NOT FINAL;
/


create or replace type TP_Cliente UNDER TP_Pessoa (

        cpf_cliente Varchar2(9),
        data_de_cadastro DATE

)FINAL;

/
create or replace type TP_Empregado UNDER TP_Pessoa(

            cpf_empregado VARCHAR2(9),
            salario number,
            data_de_contratacao DATE,
            ref_curriculo_emp REF TP_Curriculo,
            ref_chefe REF TP_Empregado
)FINAL;
/

create or replace type TP_Dependente as object(

        cpf_dependente VARCHAR2(9),
        cpf_titular VARCHAR2(9),
        ref_cpf_titular REF TP_Cliente,
        nome_dependente VARCHAR2(50),
        idade_dependente INTEGER,
        redes_sociais TP_Redes



)FINAL;
/


create or replace type TP_Editora as object (

        cnpj VARCHAR2(50),
        nome VARCHAR2(50),
        telefone_editora TP_Tel


)FINAL;
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
        ref_id_livro REF TP_Livro,
        MEMBER FUNCTION extend_tempo (val NUMBER) RETURN NUMBER

)FINAL;
/

CREATE or replace type BODY TP_Garantia IS
MEMBER FUNCTION extend_tempo(val NUMBER) RETURN NUMBER IS
begin
    RETURN self.tempo_garantia + val;
end;

END;
/


create or replace type TP_Compra as object (
        cpf_compra_cliente Varchar2(9),
        cpf_compra_empregado VARCHAR2(9),
        id_compra_livro NUMBER,
        valor NUMBER,
        data_compra DATE,
        ref_cpf_empregado REF TP_Empregado,
        ref_compra_cpf_cliente REF TP_Cliente,
        ref_compra_id_livro REF TP_Livro

)FINAL;
/
