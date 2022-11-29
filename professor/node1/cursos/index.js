const express = require('express');
const cors = require('cors');

const server = express();
server.use(cors());
server.use(express.json());

const cursos = ['FrontEnd React', 'Java', 'GitHub'];

//TIPOS DE ROTAS
//GET - leitura
//POST - Cadastro
//DELETE - Exluir
//PUT - Atualizar

server.get('/cursos', (req, res) => {
    return res.json(cursos)
});

function isValidIndex(index) {
    return !!cursos[index]
}

function validarCurso(curso) {
    let isValido = true;
    cursos.forEach((c) => {
        if (curso == c) {
            isValido = false;
        }
    })
    return isValido;
}

server.get('/cursos/:index', (req, res) => {
    const { index } = req.params;
    if (isValidIndex(index)) {
        return res.json(cursos[index])
    } else {
        return res.json('Curso não encontrado!')
    }
})

server.post('/cursos', (req, res) => {
    const { nome } = req.body;

    if (validarCurso(nome)) {
        cursos.push(nome);
        return res.json(cursos);
    } else {
        return res.json('Curso já cadastrado');
    }

})


server.put('/cursos/:index', (req, res) => {
    const { index } = req.params;
    const { nome } = req.body;

    if (isValidIndex(index) && validarCurso(nome)) {
        cursos[index] = nome;
        return res.json(cursos);
    } else {
        return res.json('Erro no cadastro!');
    }
})

server.delete('/cursos/:index', (req, res) => {
    const { index } = req.params;
    cursos.splice(index, 1);

    return res.json(cursos);
})


server.listen(3000, () => {
    console.log('Server is up!!!');
});