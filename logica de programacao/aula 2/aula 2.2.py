#vamos utilizar a mesma logica, porem utilizamos if / elif / else

num1 = float(input('digite o primeiro numero: '))
num2 = float(input('digite o segundo numero: '))

if(num1==10 and num2==10):
    print("numeros reservados")


elif (num1>num2):
    print('primeiro numero maior que o segundo')


elif(num1==num2):
    print('numeros iguais')


else:
    print('segundo numero maior que o primeiro')
