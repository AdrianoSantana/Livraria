-------------------------------------------------------Editora-------------------------------------------------

INSERT INTO TB_Editora 
VALUES ('111000','Editora 1',TP_Tel(TP_Fone('900001425')));

INSERT INTO TB_Editora 
VALUES ('222000','Editora 2',TP_Tel(TP_Fone('981251425')));

INSERT INTO TB_Editora 
VALUES ('444000','Editora 3',TP_Tel(TP_Fone('975892234')));

INSERT INTO TB_Editora 
VALUES ('555000','Editora 4',TP_Tel(TP_Fone('981818181')));

INSERT INTO TB_Editora 
VALUES ('333000','Editora 5',TP_Tel(TP_Fone('981818181'), TP_Fone('991919191')));

-------------------------------------------------- Curriculo -----------------------------------------------------

INSERT INTO TB_Curriculo 
VALUES (010,'Livraria B','Médio');
INSERT INTO TB_Curriculo  
VALUES (011,'Livraria da esquina','Superior');
INSERT INTO TB_Curriculo 
 VALUES (012,'Livraria Amanhecer','Médio');
INSERT INTO TB_Curriculo 
 VALUES (013,'Livraria Verde','Fundamental');
INSERT INTO TB_Curriculo 
 VALUES (014,'Livraria Cultura','Superior');

 ----------------------------------------------- Livro ---------------------------------------------------------------
INSERT INTO TB_Livro VALUES (0100,'Livro 1', (select ref (e) from TB_Editora e where e.cnpj = '111000'));
INSERT INTO TB_Livro VALUES (0200,'Livro 2', (select ref (e) from TB_Editora e where e.cnpj = '222000'));
INSERT INTO TB_Livro VALUES (0300,'Livro 3', (select ref (e) from TB_Editora e where e.cnpj = '333000'));
INSERT INTO TB_Livro VALUES (0400,'Livro 4', (select ref (e) from TB_Editora e where e.cnpj = '444000'));
INSERT INTO TB_Livro VALUES (0500,'Livro 5', (select ref (e) from TB_Editora e where e.cnpj = '555000'));

------------------------------------------ Garantia --------------------------------------------------------------
INSERT INTO TB_Garantia 
VALUES (1000,12,to_date ('13/07/2019', 'dd/mm/yyyy'), (select ref(l) from TB_Livro l where l.id_livro = 0100) );

INSERT INTO TB_Garantia 
VALUES (2000,12,to_date ('13/08/2019', 'dd/mm/yyyy'), (select ref(l) from TB_Livro l where l.id_livro = 0200) );

INSERT INTO TB_Garantia 
VALUES (3000,12,to_date ('13/09/2019', 'dd/mm/yyyy'), (select ref(l) from TB_Livro l where l.id_livro = 0300) );

INSERT INTO TB_Garantia 
VALUES (4000,12,to_date ('13/10/2019', 'dd/mm/yyyy'), (select ref(l) from TB_Livro l where l.id_livro = 0400) );

INSERT INTO TB_Garantia 
VALUES (5000,12,to_date ('13/11/2019', 'dd/mm/yyyy'), (select ref(l) from TB_Livro l where l.id_livro = 0500) );

-------------------------------- Empregado --------------------------------------------------------------------
INSERT INTO TB_Empregado VALUES
('Nome 1',TP_End('50740','RUA A'),TP_Tel(TP_Fone('900001111')),'000000000',1500,to_date ('01/07/2018', 'dd/mm/yyyy'), 
(select ref(c) from TB_Curriculo c where c.curriculo_id = '010'),
(select ref(b) from TB_Empregado b where b.cpf_empregado = NULL)
);

INSERT INTO TB_Empregado VALUES
('Nome 2',TP_End('60030','RUA B'),TP_Tel(TP_Fone('900002222')),'111111111',2000,to_date ('01/07/2018', 'dd/mm/yyyy'), 
(select ref(c) from TB_Curriculo c where c.curriculo_id = '011'),
(select ref(b) from TB_Empregado b where b.cpf_empregado = '000000000')
);

INSERT INTO TB_Empregado VALUES
('Nome 3',TP_End('74050','RUA C'),TP_Tel(TP_Fone('900003333')),'222222222',2500,to_date ('01/07/2018', 'dd/mm/yyyy'), 
(select ref(c) from TB_Curriculo c where c.curriculo_id = '012'),
(select ref(b) from TB_Empregado b where b.cpf_empregado = '000000000')
);

INSERT INTO TB_Empregado VALUES
('Nome 4',TP_End('74740','RUA D'),TP_Tel(TP_Fone('900004444')),'333333333',3000,to_date ('01/07/2018', 'dd/mm/yyyy'), 
(select ref(c) from TB_Curriculo c where c.curriculo_id = '013'),
(select ref(b) from TB_Empregado b where b.cpf_empregado = '111111111')
);

INSERT INTO TB_Empregado VALUES
('Nome 5',TP_End('04030','RUA E'),TP_Tel(TP_Fone('900005555')),'444444444',3500,to_date ('01/07/2018', 'dd/mm/yyyy'), 
(select ref(c) from TB_Curriculo c where c.curriculo_id = '014'),
(select ref(b) from TB_Empregado b where b.cpf_empregado = '000000000')
);


-------------------------------------------Cliente---------------------------------------------------------------
INSERT INTO TB_Cliente VALUES 
('Cliente 1', TP_End('12345','RUA F'),TP_Tel(TP_Fone ('900006666')),'555555555',to_date ('04/01/2012', 'dd/mm/yyyy'));

INSERT INTO TB_Cliente VALUES 
('Cliente 2', TP_End('54321','RUA G'),TP_Tel(TP_Fone ('900007777')),'666666666',to_date ('03/02/2013', 'dd/mm/yyyy'));

INSERT INTO TB_Cliente VALUES 
('Cliente 3', TP_End('12222','RUA H'),TP_Tel(TP_Fone ('900008888')),'777777777',to_date ('04/03/2014', 'dd/mm/yyyy'));

INSERT INTO TB_Cliente VALUES 
('Cliente 4', TP_End('13333','RUA I'),TP_Tel(TP_Fone ('900009999')),'888888888',to_date ('04/03/2014', 'dd/mm/yyyy'));

INSERT INTO TB_Cliente VALUES 
('Cliente 5', TP_End('14444','RUA J'),TP_Tel(TP_Fone ('911111111')),'999999999',to_date ('01/07/2019', 'dd/mm/yyyy'));

------------------------------------------------- Dependente -------------------------------------------------------

INSERT INTO TB_Dependente 
VALUES ('000001111','999999999',(select ref(c) from TB_Cliente c where c.cpf_cliente = '999999999'),
'Dependente 1',12, TP_Redes('Facebook','Instagram','Twiiter'));

INSERT INTO TB_Dependente 
VALUES ('000002222','888888888',(select ref(c) from TB_Cliente c where c.cpf_cliente = '888888888'),
'Dependente 2',15,TP_Redes('Facebook','Instagram'));

INSERT INTO TB_Dependente 
VALUES ('000003333','777777777',(select ref(c) from TB_Cliente c where c.cpf_cliente = '777777777'),
'Dependente 3',11,TP_Redes('Facebook','Instagram','Twiiter'));

INSERT INTO TB_Dependente 
VALUES ('000004444','666666666',(select ref(c) from TB_Cliente c where c.cpf_cliente = '666666666'),
'Dependente 4',14,TP_Redes('Facebook','Twiiter'));

INSERT INTO TB_Dependente 
VALUES ('000005555','555555555',(select ref(c) from TB_Cliente c where c.cpf_cliente = '555555555'),
'Dependente 5',13,TP_Redes('Facebook'));


---------------------------------------- Compra ---------------------------------------------------------

INSERT INTO TB_Compra 
VALUES ('555555555','000000000',0300,35,to_date('04/01/2012','dd/mm/yyyy'),
(select ref(e) from TB_Empregado e where e.cpf_empregado = '000000000'),
(select ref(c) from TB_Cliente c where c.cpf_cliente = '555555555'),
(select ref(l) from TB_Livro l where l.id_livro = 0300));

INSERT INTO TB_Compra 
VALUES ('666666666','000000000',0400,25,to_date('05/03/2012','dd/mm/yyyy'),
(select ref(e) from TB_Empregado e where e.cpf_empregado = '000000000'),
(select ref(c) from TB_Cliente c where c.cpf_cliente = '666666666'),
(select ref(l) from TB_Livro l where l.id_livro = 0400));


INSERT INTO TB_Compra 
VALUES ('777777777','222222222',0200,30,to_date('04/04/2014','dd/mm/yyyy'),
(select ref(e) from TB_Empregado e where e.cpf_empregado = '222222222'),
(select ref(c) from TB_Cliente c where c.cpf_cliente = '777777777'),
(select ref(l) from TB_Livro l where l.id_livro = 0200));


INSERT INTO TB_Compra 
VALUES ('888888888','111111111',0500,35,to_date('03/05/2017','dd/mm/yyyy'),
(select ref(e) from TB_Empregado e where e.cpf_empregado = '111111111'),
(select ref(c) from TB_Cliente c where c.cpf_cliente = '888888888'),
(select ref(l) from TB_Livro l where l.id_livro = 0500));


INSERT INTO TB_Compra 
VALUES ('999999999','444444444',0100,35,to_date('01/07/2018','dd/mm/yyyy'),
(select ref(e) from TB_Empregado e where e.cpf_empregado = '444444444'),
(select ref(c) from TB_Cliente c where c.cpf_cliente = '999999999'),
(select ref(l) from TB_Livro l where l.id_livro = 0100));
