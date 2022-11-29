
## Operadores Logicos 

# Operador And - and - Quando todas condições sao verdadeiras
## Operador OR - or - Quando apenas 1 das condições sao verdadeira
# Operador not - not - Quando ele inverte a condição da sentença


"""

num1 = 34
num2 = 22
num3= 11

#Operador AND
print(num1>num2 and num3<num1)

# Operador OR

print(num1>num2 or num3>num1)

#Operador NOT

print(num1<num2 or not num3<num1)


## Entrada de Dados com input

nome = input('Digite o Seu Nome:')

print("Ola",nome)

num4 = int(input("Digite o Primeiro Valor :"))

num5 = float(input("Digite o Segundo Valor : "))

print("A Soma é: ",(num4+num5))


"""

"""
## Programa que calcula a media das notas ##

nota1 = int(input("Digite a 1 Nota: "))
nota2 = int(input("Digite a Segunda Nota: "))
nota3 = int(input("Digite a Terceira Nota: "))


print("A Média é: ",(nota1+nota2+nota3)/3)

"""

# Vamos utlizar a mesma logica das Condicionais porem em python
# Utilziamos if/elif/else


num1 = float(input("Digite o Primeiro Numero: "))
num2 = float(input("Digite o Segundo Numero: "))


if(num1== 10 and num2==10):
    print("Numeros Reservado")

elif(num1>num2):
    print("Primeiro Numero Maior que o Segundo")

elif(num1==num2):
    print("Numero Iguais")

else:
    print("Segundo Numero MAior que o Primeiro")