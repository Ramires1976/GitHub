const veiculos = [];

function executarMenu() {
const resultado = prompt(`
(1) Casdastrar Veiculo
(2)
(3) Apresentar Veiculos
(4) Sair
`)

if(resultado == "1") {
cadastrarVeiculo()
}

if(resultado == "3") {
console.log(veiculos);
}


if(resultado != "4") {
executarMenu();
}
}

function cadastrarVeiculo() {
const veiculo = {
cor: prompt('Digite a cor do veiculo'),
ano: prompt('Digite o ano do veiculo')
}

veiculos.push(veiculo)

}


executarMenu()