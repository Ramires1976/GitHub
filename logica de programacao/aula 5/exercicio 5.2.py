dic_cores= {'A':'AMARELO','B':'BRANCO', 'R':'ROXO', 'V':'VERDE'}

for d in dic_cores.items():
    print(d)

print(dic_cores['v'])

dic_carros={(0,100):'gol', (0,140):'fiesta', (0,200):'fusion', (0,400):'uno com escada'}



novas_cores= {'Ve': "vermelho", 'P': "preto"}

dic_cores.update(novas_cores)

print(dic_cores)

dic_cores.pop("Ve")

print (dic_cores)

carros_novos=dic_carros

print(carros_novos)