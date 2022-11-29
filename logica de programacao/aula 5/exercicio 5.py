lista_mista = ['floripa',10,'sao jose', 12, 'palhoça', 6]

print(len(lista_mista))

lista_mista.append(23)
lista_mista.append(43)

print(lista_mista)

for l in lista_mista:
    print (l)

del lista_mista[7]
print (lista_mista)

#ou 

lista_mista.pop()

cidade = input('digite o nome ou numero:')

if cidade in lista_mista:
    print(" esta na lista")
else:
    print("nao esta na lista")