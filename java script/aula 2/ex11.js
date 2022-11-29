function validarnumero (){
    let numero = window.prompt(`
    nota entre 0 e 10

    `)

    if (numero >= 10 && numero <= 0){
        alert ( "valor valido" )
    } else(  "valor invalido")
    validarnumero()
    
}


