function validarlogin(){
    
    let nome = window.prompt(`nome`)

    if (nome.length <=3){
        alert ("valido")
        validarlogin()
    } else ("invalido")

    let idade = window.prompt(`idade`)

    if (idade >= 150 && idade <= 0){
        alert ("valido")
        validarlogin()
    } else ("invalido")

    let salario = window.prompt(`salario`)

    if (salario < 0){
        alert ("invalido")
        validarlogin()
    }
    
    let sexo = window.prompt ( 'M ou F')

    if (sexo != M && sexo != F){
        alert ("invalido")
        validarlogin()
    }

    let estadocivil = window.prompt ( 'S ou C ou V ou D')

    if (estadocivil == S && estadocivil == C && estadocivil == V && estadocivil == D ){
        alert ("valido")
        validarlogin()
    } else ("invalido")
    
}

validarlogin()