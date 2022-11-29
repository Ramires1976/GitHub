
## laços FOR ##

## laço FOR em python sao necessitam de um container (ou item para percorrer)
#esses itens podem ser uma estrutura de dados ou ate variaveis 
#paraisso precisamos entender a nossa primeira estrutura de dados a lista
# a lista e uma estrutura finita e possui indica de memoria para classifar
#seus elementos
#simplcando a lista e uma variavel que possui diversos valores
## exemplo de uma estrutura de dados lista
## a lista é declarada entre colchetes []

frutas = ['morango','pera','abacaxi','maça']

## entendo os indices de memoria de uma lista
## todos indices de memoria de uma estrutura de dados comeca com 0

print(frutas[3])

# laços FOR

for f in frutas:
    print(f)

nome = 'Joao Ricardo'

for n in nome:
    print(n)

# funçao range gera valores inteiros passando um inicio e fim

for num in range(0,20):
    print(num)

# funçao enumerate exibe o indice de memoria o valor da estrutura

for f,f2 in enumerate(frutas):
    print (f,f2)

# principio do laço mesmo travando a saida como a posicao da memoria

for f in frutas:
    print (frutas[2])

# declarando uma lista dentro do FOR 9 lista local

for mult in [1,2,3,4,5]:
    print (mult*10)
    