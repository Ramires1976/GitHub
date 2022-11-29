let nome = prompt('digite nome')

let nota1 = Number(prompt("digite a primeira nota: "))
let nota2 = Number(prompt("digite a segunda nota: "))
let nota3 = Number(prompt("digite a terceira nota: "))

let media_nota = (nota1+nota2+nota3)/3

alert ('nome do aluno é:' +nome)
alert("a media das notas é: "+media_nota)

if(media_nota >=8){
    alert("aprovado")
}

else{
    alert('reprovado')
}

