### Lista em Python possuem as mesmas caracteristicas que os Arrays em JS
# São mutaveis e possuem indice de memória ###

lista_numeros = [23,78,12,65,1]
lista_carros = ["Mercedes","Opala","Ferrari","Uno"]
lista_mista = ["Mercedes",67,"Brasilia",12,"Ferrari",6]  # Heterogenea misturar tipos de dados

print(lista_carros)
print(lista_mista)

## Imprimir valor trazerndo a posição de memória

print(lista_carros[3])

## Trazer o tamanho de uma lista com a função len

print(len(lista_mista))

## Adicionar um item a lista com a função append

lista_mista.append(67.57)

print(lista_mista)

## Deletar elemento de uma lista com a funcao

del lista_mista[1]

print(lista_mista)

del lista_mista[4:6] # Elimina um range de indice de memoria

print(lista_mista)

del lista_mista[:]

print(lista_mista)

## Percorrer com laço for uma lista

for l in lista_carros:
    print(l)

## Ordenar e ordem crescente e descrente uma lista

## Com as funções sort e reverse

# ordenar com a sort

lista_numeros.sort()
print(lista_numeros)

lista_carros.sort()
print(lista_carros)

## Reverse

lista_numeros.reverse()
print(lista_numeros)

lista_carros.reverse()
print(lista_carros)

## Condicionais com listas



if 'Mercedes' in lista_carros:
    print("Esse carro esta na lista")
else:
    print("Esse carro nao esta na lista")



############### Trabalhando com Tuplas ###

# Tupla e uma estrutura de dados parecida com a lista
# Porém a mesma é imutavel (não pode adicionar ou remover elementos)
# A Tupla e mais performatica do que a lista
# A tupla é definida por virgulas. Exceto se ela estive dentro de outra estrutura de dados 
# Onde sera obrigatorio utlizar os parenteses para separar 

#EX = lista = [(1,2,3)]

#EX de tuplas


tupla1 = (1,67,21,10)
tupla2 = 1,56,21,89
tupla3 = 12,
tupla4 = 12
tupla5 = "João","Pedro"

print(type(tupla1))
print(type(tupla2))
print(type(tupla3))
print(type(tupla4))
print(type(tupla5))


## Tamanho da tupla

print(len(tupla1))

print(tupla5[0])


## Função de calculos em estruturas de dados

print(sum(tupla1))
print(max(tupla1))

## Testando a imutabilidade da tupla

tupla6 = tupla1+tupla5
print(tupla6)

## Condicionais com tuplas

if 45 in tupla1:
    print("Esta la")
else:
    print("Não esta la")


## Iterar com laço for 

for i in tupla6:
    print(i)



############ Trabalhando com Dicionarios #############

# Dicionarios tabalham com formado JSON (chave:valor)
# E a principal estrutura de dados para integracao entre linguagens e sistemas
# Os dicionarios nao possuem nocao de indices.Apenas com os vlaores de chaves

#EX:

dicionario = {'chave':'valor'}


frutas_iniciais = {"A":"Abacate","M":"Melancia","L":"Limão","B":"Banana","Ab":"Abobora"}

# Trazer o valor de um dicionario basta passar a chave

print(frutas_iniciais["L"])

## Passsar um laço for em dicionario

for dic in frutas_iniciais:
    print(dic,frutas_iniciais[dic])


# Função tras os valores do dicionario
for dic in frutas_iniciais.items():
    print(dic)


## Trazer apenas os valores do dicionario no laço for

for dic in frutas_iniciais.values():
    print(dic)

## Trazer apenas as chaves do dicionario no laço for

for dic in frutas_iniciais.keys():
    print(dic)

### Utilzando dicionarios com tuplas ##

n_ruas = {

    (100,200):"Rua do Braz",
    (1,100):"Rua da Arvores",
    (50,230):"Rua dos Atletas",


}

print(n_ruas)

## Dicionario são mutaveis (Acrescentar,Remover)

# Adicionando um novo valor

n_ruas[(200,500)] = "Rua das Camelias"

print(n_ruas)

n_ruas.update({(200,100):"Rua Abilio Costa"})

print(n_ruas)

## Remover um valor de dicionario

del n_ruas[(1,100)]

print(n_ruas)

## Extrair de um dicionario um valor com o pop 

frutas_iniciais.pop("Ab")

print(frutas_iniciais)


### Limpar dados de dicionario(zerar)

frutas_iniciais.clear()
print(frutas_iniciais)


## Copiar um dicionario 

novas_ruas = n_ruas.copy()
novas_ruas = n_ruas

print(novas_ruas)