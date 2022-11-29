# funcoes com condicionais

def validausuario(nome_usuario, senha):
    if nome_usuario == 'admin' and senha== 'python':
        return 'usuario e senha corretos bem vindo'
    elif nome_usuario == 'admin':
        return 'usuario correto'
    elif senha == 'python':
        return 'senha correta'
    else:
        return 'usuario e senha incorreto'

print(validausuario('joao',1234))


