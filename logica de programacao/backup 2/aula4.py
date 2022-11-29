### Laços iteradores FOR ###

## Laço for em Python são iteradores necessitam de um container(ou item para percorrer)
# Esses itens podem ser uma estrutura de dados ou até variaveis

# Para isso precisamos entender a nossa primeira estrutura de dados a lista

# A lista é uma estrutura finita e possui indice de memória para classificar 
# Seus elementos 
# Simplicando a lista e uma variavel que possui diversos valores

## Exemplo de uma estrutura de dados lista
## A lista é declarada entre colchetes []

frutas = ["Morango","Pera","Abacaxi","Maça"]

## Entendo os indices de memoria de uma lista

# Todos indice de memoria de uma estrutura de dados começa com 0

#print(frutas[3])


# Laço For 

for f in frutas:
    print(f)


nome = "João Ricardo"

for n in nome:
    print(n)

# Função range gera valores inteiro passando um inicio e fim

for num in range(0,21):
    print(num)

# Função Enumerate exibe o indice de memória o valor da estrutura

for f,f2 in enumerate(frutas):
    print(f,f2)


# Principio do laço mesmo tavando a saida como a posicao de memoria

for f in frutas:
    print(frutas[2])


# Declarando uma lista dentro do for (lista local)

for mult in [1,2,3,4,5]:
    print(mult*10)


############## Trabalhando com Funções #############

# AS Funções em Python possuem a mesmo objetivo que as funções em outras linguagens
# Otimizar linhas de codigo e repetições

## Em JS para declarar uma funcao e function em python é def


# Criando funções sem argumento

def oi():
    print("Olá estou dando OI")


# Chamando a função

oi()


# Função com argumento

def soma(a,b):
    return a+b



# Chamando a funcao

print(soma(4,5))



## Funcao com Parametro ou Argumento Nomeado

def identificacao(meu_nome,idade):
    print("Olá",meu_nome,"Sua Idade: ",idade)


## Chamar a função

identificacao("João",36)


identificacao(idade=36,meu_nome="João")


## Funcoes com argumento Padrao

"""
salario = float(input("Digite seu salario: "))


def salario_desconta_imposto(salario,imposto=25): # Parametro Padrao da função
    return salario - (salario * imposto * 0.01)


## Chamando a função com sobreposição de argumento padrao

print(salario_desconta_imposto(salario,10))

# chamando a funcão com parametro padrao

print(salario_desconta_imposto(salario))

# Outro exemplo de funcao com argumento padrao

print() # Padro do PRint e vazio
print("Sobrepus") # Escrevendo algo esta sobrepondo o padao da função.

"""

## Funções com Condicionais  ###

## Validacao de Usuario e senhas ###


def validausuario(nome_usuario,senha):
    if nome_usuario =='admin' and senha=='python':
        return "Usuario e Senha Corretos Bem Vindo"
    elif nome_usuario == 'admin':
        return "Usuário Correto"
    elif senha == 'python':
        return "Senha Correta"
    else:
        return "Usuário e Senha Incorretos"


## Chamando a função de validação

print(validausuario('admin','python'))






