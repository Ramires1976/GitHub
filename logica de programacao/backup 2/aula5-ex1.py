
#1)




lista_produtos = ["Cebola",6.50,"Detergente",10.67,"Macarrão",7.90]

print(len(lista_produtos))

#2)

cores = ["Amarelo","Verde","Azul"]

cores.append("Vermelho")
cores.append("Roxo")

print(cores)

#3)

for i in lista_produtos:
    print(i)

#4 )

del lista_produtos[5]

#lista_produtos.pop()

print(lista_produtos)

#5)

cores.sort()
print(cores)

cores.reverse()
print(cores)

#6)

cor = input("Digite a Cor: ")

if cor in cores:
    print("Essa cor esta na lista")
else:
    print("Essa cor nao esta na lsita")