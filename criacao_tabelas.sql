DROP TABLE TB_Curriculo;
DROP TABLE TB_Cliente;
DROP TABLE TB_Dependente;
DROP TABLE TB_Editora;
DROP TABLE TB_Empregado;
DROP TABLE TB_Livro;
DROP TABLE TB_Garantia;
DROP TABLE TB_Compra;



CREATE TABLE TB_Curriculo of TP_Curriculo (

    PRIMARY KEY(curriculo_id)

);
/

CREATE TABLE TB_Cliente of TP_Cliente (

        PRIMARY KEY(cpf_cliente)

);
/

CREATE TABLE TB_Empregado of TP_Empregado (

        PRIMARY KEY(cpf_empregado),
        FOREIGN KEY(ref_chefe) REFERENCES TB_Empregado

);
/

CREATE TABLE TB_Dependente of TP_Dependente (

    FOREIGN KEY (ref_cpf_titular) REFERENCES TB_Cliente,
    PRIMARY KEY(cpf_dependente, cpf_titular)

);
/

CREATE TABLE TB_Editora of TP_Editora (

    PRIMARY KEY(cnpj)

);
/

CREATE TABLE TB_Livro of TP_Livro (

    PRIMARY KEY(id_livro),
    FOREIGN KEY(ref_cnpj) REFERENCES TB_Editora

);
/

CREATE TABLE TB_Garantia of TP_Garantia (

    PRIMARY KEY(id_garantia),
    FOREIGN KEY(ref_id_livro) REFERENCES TB_Livro

);
/

CREATE TABLE TB_Compra of TP_Compra (

    FOREIGN key(ref_cpf_empregado) REFERENCES TB_Empregado,
    FOREIGN KEY(ref_compra_cpf_cliente) REFERENCES TB_Cliente,
    FOREIGN key(ref_compra_id_livro) REFERENCES TB_Livro,
    PRIMARY key(cpf_compra_cliente,cpf_compra_empregado,id_compra_livro,data_compra)
    

);
/