### lista em python possuem as mesmas caraceteristicas que os arrays em JS
# sao mutaveis e possuem indice de memoria

lista_numeros = [23,78,12,65,1]
lista_carros = ['mercades', 'opala', 'ferrari', 'uno']
lista_mista = ['mercades',67,'brasilia', 12, 'ferrari', 6]

print(lista_carros)
print(lista_mista)

print(lista_carros[3])

print(len(lista_mista))

lista_mista.append(67)
lista_mista.append(57)

print(lista_mista)

del lista_mista[1]

print(lista_mista)

del lista_mista[4:6] # elimina um range de indice de memoria

print (lista_mista)

del lista_mista[:]

print(lista_mista)

for l in lista_carros:
    print (l)

lista_numeros.sort()
print(lista_numeros)

lista_carros.sort()
print(lista_carros)

lista_mista.sort() #errado
print(lista_mista)

lista_numeros.reverse()
print(lista_numeros)

lista_carros.reverse()
print(lista_carros)

if 'mercedes'in lista_carros:
    print("esse carro esta na lista")
else:
    print("esse carro nao esta na lista")


