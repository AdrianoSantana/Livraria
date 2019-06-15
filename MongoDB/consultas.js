// CONSULTAS


// 1. Uma consulta de atualização utilizando o valor prévio do campo - Marton

db.funcionarios.update( {salario: 2500}, {$set: {salario: 2700}});


// 2. Uma consulta de atualização utilizando ReplaceOne - Marton

db.funcionarios.replaceOne(
  {nome : "Marilza"},
  {
    nome:"Marilza",
    salario: 2000,
    escolaridade: "medio",
    cpf: 00000000003
   }
);


// 3. Uma consulta para remover ou renomear um campo do documento - Marton

db.funcionarios.updateMany( {}, {$rename: {"cpf": "CPF"}} );


// 4. Uma consulta utilizando busca em string - Marton

db.clientes.find({nome:/J/}).pretty();


// 5. Uma consulta utilizando operadores de comparação - Marton

db.funcionarios.updateMany(
  {salario: {$lte: 2500}},
  {$set: {salario: 2500}}
);


// 6. Uma consulta com projeção - Marton

db.funcionarios.find({}, {nome: 1, salario: 1, _id: 0});


// 7. Uma consulta limitando a quantidade de documentos retornados - Marton

db.funcionarios.find({nome: /^E/}).limit(3).pretty();


// 8. Uma consulta utilizando ordenação - Marton

db.funcionarios.find().sort({salario:-1}).pretty();


// 9. Uma consulta utilizando operadores lógicos - Marton

db.funcionarios.find( {$or: [{salario: 2500}, {CPF: 00000000001}]} ).pretty();


// 10. Uma consulta com o operador $exists - Marton

db.clientes.find( {telefone_id: { $exists: true }}).pretty();


// 11. Uma consulta com o operador $type - Marton

db.funcionarios.find( {"CPF" : {$type: "number"}} ).pretty();


// 12. Uma consulta utilizando MapReduce - Marton

db.funcionarios.mapReduce(
  function() { emit(this.escolaridade, this.salario ); },
  function(key, values) { return Array.sum(values)},
  {
    query: { salario: {$gte: 2300} },
    out: "despesas_altas_funcionarios"
  }
);


// 13. Uma consulta de agregação - Marton

db.funcionarios.aggregate([
  { $group:
    {
      _id: "$salario",
      quantidade: { $sum: 1 }
    }
  }
]);


// 14. Uma junção de tabela com unwind - Marton

db.telefones.aggregate([
  {
    $lookup:
    {
      from: "clientes",
      localField: "_id",
      foreignField: "telefone_id",
      as: "resultado"
    }
  },
  {
    $unwind:
    {
      path: "$resultado",
      preserveNullAndEmptyArrays: false
    }
  }
]).pretty();


// 15. Uma consulta utilizando todos os itens de 4 a 14 (exceto o 12)  
