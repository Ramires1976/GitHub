# trabalhando com dicionarios
# dicionarios trabalham com formato JSON (chave : valor)
# é a principal estrutura de dados para integração entre linguagem e sistemas
# OS DICIONARIOS NAO POSSUEM nocao de indice... apenas com os valores de chaves

dicionario={'chave':'valor'}

frutas_iniciais = {'A':'ABACATE','M':'MELANCIA','L':'LIMAO','B':'BANANA'}

print(frutas_iniciais['L'])

for dic in frutas_iniciais:
    print(dic,frutas_iniciais[dic])

for dic in frutas_iniciais.items():
    print(dic)

for dic in frutas_iniciais.values():
    print(dic)


for dic in frutas_iniciais.keys():
    print(dic)

n_ruas = {

    (100,200):'ruas do braz',
    (1,100): 'rua da arvores',
    (50,230):'rua dos atletas',
}

print(n_ruas)

n_ruas[(200,500)] = 'ruas das camelias'

print(n_ruas)

n_ruas.update({(200,100):'rua abilio costa'})

print(n_ruas)

del n_ruas[(1,100)]

print (n_ruas)

frutas_iniciais.pop('A')

print(frutas_iniciais)

frutas_iniciais.clear()
print(frutas_iniciais)

novas_ruas= n_ruas.copy()
novas_ruas=n_ruas

print ( novas_ruas)








