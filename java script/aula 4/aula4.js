const pessoas = [
{
nome: "Gabriel",
cpf: "109.123.123-12",
altura: 1.81,
sexo: "M",
casado: false,
},
{
nome: "Gabriel",
cpf: "109.123.123-12",
altura: 1.81,
sexo: "M",
casado: false,
},
];


const veiculo = {
marca: "vw",
modelo: "gol",
ano: 2019,
cor: 'test',
acelerar: function() {
alert(`O ${this.modelo} acelerou!!!`)
},
motorista: pessoas[0]

}


