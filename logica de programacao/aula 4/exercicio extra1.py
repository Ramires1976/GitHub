def soma(a,b,c):
    return a+b+c

print(soma(4,5,5))

quanthora=float(input('digite a quantidade de horas:'))

def hora_extra(quanthora, horaex=100):
    return quanthora * horaex

print (hora_extra(quanthora))


def validausuario(nome_usuario, CPF):
    if nome_usuario == 'rjs' and CPF== '12312312345':
        return 'Nome e CPF corretos bem vindo'
    elif nome_usuario == 'rjs':
        return 'Nome correto'
    elif CPF == '12312312345':
        return 'CPF correto'
    else:
        return 'Nome e CPF incorreto'

print(validausuario('rjs',12312312345))


