# trabalhando com funcoes

# as funcoes do python possuem a mesma objetivo que as funcoes em outras linguagens
# otimizar linhas de codigo e repetiçoes
# em JS para delcarar uma funcao é function e em python é def

def oi():
    print('ola estou dando oi')

oi()

def soma(a,b):
    return a+b

print(soma(4,5))

def ident(meu_nome, idade):
    print ('ola', meu_nome,'sua idade', idade )

ident('joao',36)

ident(idade=36,meu_nome = 'joao')

salario=float(input('digite seu salario:'))

def salario_desconto_imposto(salario, imposto):
    return salario - (salario * imposto* 0.01)

print (salario_desconto_imposto(salario,10))

def salario_desconto_imposto(salario, imposto=25):
    return salario - (salario * imposto* 0.01)

print (salario_desconto_imposto(salario))

print() # padrao do print é vazio
print('sobrepus') # escrevendo algo, esta sobrepondo o padrao da funcao


