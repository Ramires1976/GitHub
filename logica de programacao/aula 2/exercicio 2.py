
nota1 = int(input("digite a primeira nota: "))
nota2 = int(input("digite a segunda nota: "))
nota3 = int(input("digite a terceira nota: "))

media_nota = (nota1+nota2+nota3)/3

if(media_nota>7):
    print("aluno aprovado")


elif(media_nota==6 and media_nota==5):
    print('aluno em recuperação')



else:
    print('aluno reprovado')