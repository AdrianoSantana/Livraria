// CRIACAO DE COLECOES



// FUNCIONARIOS

db.funcionarios.insert({
    nome: "Eliomar",
    salario: 1500,
    escolaridade: "fundamental",
    cpf: 00000000000
}
);

db.funcionarios.insert({
    nome: "Elenildo",
    salario: 2000,
    escolaridade: "medio",
    cpf: 00000000001
}
);

db.funcionarios.insert({
    nome: "Alberto",
    salario: 1500,
    escolaridade: "medio",
    cpf: 00000000002
}
);

db.funcionarios.insert({
    nome: "Marilza",
    salario: 3000,
    escolaridade: "medio",
    cpf: 00000000003
}
);

db.funcionarios.insert({
    nome: "Josiane",
    salario: 2200,
    escolaridade: "superior",
    cpf: 00000000004
}
);

db.funcionarios.insert({
    nome: "Esmeralda",
    salario: 3400,
    escolaridade: "superior",
    cpf: 00000000005
}
);

db.funcionarios.insert({
    nome: "Ernesto",
    salario: 2600,
    escolaridade: "superior",
    cpf: "00000000006" //string, para realizar a consulta 11
}
);


// TELEFONES

db.telefones.insert({
    _id: "jose",
    numero: 993429243
}
);

db.telefones.insert({
    _id: "marina",
    numero: 982310999
}
);

db.telefones.insert({
    _id: "elen",
    numero: 973424455
}
);



// CLIENTES + RELACIONAMENTOS POR REFERENCIA + RELACIONAMENTOS POR DOCUMENTO EMBUTIDO

db.clientes.insert({
    nome: "José",
    cpf: 111111111,
    sexo: 'M',
    telefone_id: "jose",
    enderecos: [
        {
            logradouro: "Avenida Coqueiros 45",
            cidade: "Recife",
            estado: "PE"
        }
    ]
}
);

db.clientes.insert({
    nome: "João",
    cpf: 222222222,
    sexo: 'M',
    enderecos: [
        {
            logradouro: "Avenida do Bananal 903",
            cidade: "Recife",
            estado: "PE"
        },
        {
            logradouro: "Rua Amarildo Jose 245",
            cidade: "Santos",
            estado: "SP"
        }
    ]
}
);

db.clientes.insert({
    nome: "Caio",
    cpf: 333333333,
    sexo: 'M',
    telefone_id: "marina",
    enderecos: [
        {
            logradouro: "Avenida Coqueiros 340",
            cidade: "Recife",
            estado: "PE"
        }
    ]
}
);

db.clientes.insert({
    nome: "Elen",
    cpf: 444444444,
    sexo: 'F',
    telefone_id: "elen",
    enderecos: [
        {
            logradouro: "Avenida Doutor Rufino 34",
            cidade: "Jaboatao",
            estado: "PE"
        },
        {
            logradouro: "Avenida da Cidade 90",
            cidade: "Olinda",
            estado: "PE"
        }
    ]
}
);

db.clientes.insert({
    nome: "Marina",
    cpf: 555555555,
    sexo: 'F',
    telefone_id: "marina",
    enderecos: [
        {
            logradouro: "Avenida Coqueiros 340",
            cidade: "Recife",
            estado: "PE"
        },
        {
            logradouro: "Rua Amarela 340",
            cidade: "Olinda",
            estado: "PE"
        }
    ]
}
);



// LIVROS

db.livros.insert({
    nome: "Cálculo I",
    valor: 55
});

db.livros.insert({
    nome: "Servomecanismos",
    valor: 40
});

db.livros.insert({
    nome: "Dom Quixote",
    valor: 20
});

db.livros.insert({
    nome: "Harry Potter",
    valor: 40
});

db.livros.insert({
    nome: "A Divina Comédia",
    valor: 45
});
