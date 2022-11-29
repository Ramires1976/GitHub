function validarlogin(){
    let usuario = window.prompt(`usuario`)

    let senha = window.prompt(`senha`)


    if (usuario == senha){
        alert ("invalido")
        validarlogin()
    } else("valido")
    
    validarlogin()
    
}

validarlogin()