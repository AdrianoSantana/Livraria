DROP TABLE TB_Curriculo;
DROP TABLE TB_Cliente;
DROP TABLE TB_Dependente;
DROP TABLE TB_Editora;
DROP TABLE TB_Empregado;
DROP TABLE TB_Livro;
DROP TABLE TB_Garantia;
DROP TABLE TB_Compra;



CREATE TABLE TB_Curriculo OF TP_Curriculo (
    PRIMARY KEY(curriculo_id)
);


CREATE TABLE TB_Cliente OF TP_Cliente (
    PRIMARY KEY(cpf_cliente)
)NESTED TABLE telefone_pessoa STORE AS TB_telefone_Cliente;


CREATE TABLE TB_Empregado OF TP_Empregado (
        PRIMARY KEY(cpf_empregado),
        FOREIGN KEY(ref_chefe) REFERENCES TB_Empregado,
        FOREIGN KEY(ref_curriculo_emp) REFERENCES TB_Curriculo
) NESTED TABLE telefone_pessoa STORE AS TB_telefone_Empregado;


CREATE TABLE TB_Dependente OF TP_Dependente (
    FOREIGN KEY (ref_cpf_titular) REFERENCES TB_Cliente,
    PRIMARY KEY(cpf_dependente, cpf_titular)
);

CREATE TABLE TB_Editora OF TP_Editora (
    PRIMARY KEY(cnpj)
)NESTED TABLE telefone_editora STORE AS TB_telefone_Editora;


CREATE TABLE TB_Livro OF TP_Livro (
    PRIMARY KEY(id_livro),
    FOREIGN KEY(ref_cnpj) REFERENCES TB_Editora
);

CREATE TABLE TB_Garantia OF TP_Garantia (
    PRIMARY KEY(id_garantia),
    FOREIGN KEY(ref_id_livro) REFERENCES TB_Livro
);

CREATE TABLE TB_Compra OF TP_Compra (
    FOREIGN key(ref_cpf_empregado) REFERENCES TB_Empregado,
    FOREIGN KEY(ref_compra_cpf_cliente) REFERENCES TB_Cliente,
    FOREIGN key(ref_compra_id_livro) REFERENCES TB_Livro,
    PRIMARY key(cpf_compra_cliente,cpf_compra_empregado,id_compra_livro,data_compra)
);
