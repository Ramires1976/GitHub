
## Exercicio de Dicionarios ##

#1) 

dic_cores = {"A":"Amarelo",'B':'Branco',"R":"Roxo","V":"Verde"}

for d in dic_cores.items():
    print(d)

#2)

print(dic_cores["V"])
print(dic_cores["A"])

#3) 

dic_carros = {(0,100):"Gol",(0,140):"Fiesta",(0,200):"Fusion",(0,400):"Uno com Escada"}

# Adicionar novo elemento
dic_carros.update({(0,300):"Ferrari"})

print(dic_carros)

# Remover um elemento
del dic_carros[(0,100)]

print(dic_carros)


#4 )

novas_cores = {"Ve":"Vermelho","P":"Preto"}

dic_cores.update(novas_cores)

print(dic_cores)

#5)

dic_cores.pop("Ve")

print(dic_cores)


#6

carros_novos = dic_carros

print(carros_novos)