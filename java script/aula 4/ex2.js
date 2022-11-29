// ⦁ Crie um programa de cadastro de uma biblioteca (utilizando array como base de dados ex: baseDeLivros: [ob1, obj2,]).  
// O programa deve implementar as funcionalidades descritas na figura abaixo:

// (1) - Cadastrar;
// (2) - Pesquisar;
// (3) - Excluir;
// (4) - Alterar; (desafio)
// (5) - Filtrar livros por categoria
// (0) - Sair;

// O cadastro dos livros deve solicitar  código, título, categoria. O programa deve respeitar as seguintes restrições:
// ⦁ Não se pode cadastrar um livro com mesmo código;
// ⦁ A pesquisa deve ser feita pelo código;
// ⦁ A exclusão deve ser feita pelo código do livro;


const livros = [];
executarMenu()

function executarMenu() {
    const resultado = prompt(`
(1) - Cadastrar;
(2) - Pesquisar;
(3) - Excluir;
(4) - Alterar; 
(5) - Filtrar livros por categoria;
(0) - Sair;
`)
    if (resultado == "1") {
        cadastrarlivro()
        executarMenu()
    }

    if (resultado == "2") {
        pesquisarlivro()
        executarMenu()
    }

    if (resultado == "3") {
        exluirlivro()
        executarMenu()
    }

    if (resultado == "4") {
        alterarlivro()
        executarMenu()
    }

    if (resultado == "5") {
        filtrarlivro()
        executarMenu()
    }
}

function cadastrarlivro() {
    let codigo = prompt('Digite o codigo do livro')

    let isNovocodigo = true

    livros.forEach(livro => {
        if (livro.codigo == codigo) {
            isNovocodigo = false
        }
    })

    if (isNovocodigo) {
        const codigo = {
            codigo: codigo,
            titulo: prompt('Digite o titulo do livro'),
            categoria: prompt('Digite a categoria do livro'),

        }

        livros.push(livro)
        console.log(livros)
    } else {
        alert('livro já cadastrada!')
    }
}

function pesquisarlivro() {
    let codigo = prompt('Digite o codigo do livro');
    let isExitelivro = false


    livros.forEach(livro => {
        if (livro.codigo == codigo) {
            isExitelivro = true
            alert(`${livro.codigo} - ${livro.titulo} - ${livro.categoria}`)
        }
    })

    if (!isExitelivro) {
        alert('livro não encontrada!')
    }

}

function exluirlivro() {
    let livro = prompt('Digite o codigo do livro que deseja excluir!')
    let isExitelivro = false


    livros.forEach((livro, index) => {
        if (livro.codigo == codigo) {
            isExitelivro = true
            livros.splice(index, 1)
            alert('livro excluido!')
        }
    })

    if (!isExitelivro) {
        alert('livro não encontrado!')
    }
}