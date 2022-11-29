#tuplas

#tupla é uma estrutura de dados parecida com  a lista
#porem a mesma é imutavel(nao pode add ou remover elementos)
#a tupla é mais performatica do que a lista
#

tupla1=(1,67,21,16)
tupla2=1,56,21,89
tupla3=12,
tupla4=12
tupla5='joao','pedro'

print(type(tupla1))
print(type(tupla2))
print(type(tupla3))
print(type(tupla4))
print(type(tupla5))



print(len(tupla1))
print(tupla5[0])

print(sum(tupla1))
print(max(tupla1))

tupla6 = tupla1 + tupla5

print(tupla6)

if 45 in tupla1:
    print('esta la')
else:
    print('nao esta la')



