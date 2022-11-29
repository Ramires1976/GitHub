let pesquisas = [1,2,3,1,2,3,1,2,3,1,2,3,1,2,3]

let idades = [10,60,30,20,23,10,60,30,20,23,10,60,30,20,23]

let respostaotimo = 0

let respostaregular = 0

let respostabom = 0

let totalidadeotimo = 0;

for (let i = 0; i < pesquisas.length; i++) {
    const pesquisa = pesquisas[i];
    if (pesquisa == 3) {
        totalidadeotimo = totalidadeotimo + idades [i]
        // totalidadeotimo += idades [i]
        respostaotimo++
    }
    if (pesquisa == 1) {
        totalidadeotimo = totalidadeotimo + idades [i]
        // totalidadeotimo += idades [i]
        respostaregular++
    }
}

const mediaotimo = totalidadeotimo / respostaotimo