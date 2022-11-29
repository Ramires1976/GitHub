function executarmenu (){
    let resposta = window.prompt(`
    (1) xxxx
    (2) xxxx
    (3) xxxx
    (4) sair
    `)

if (resposta != 4){
    executarmenu()
}


}

executarmenu();