#language:pt

@todo
Funcionalidade: Cadastro
    Sendo um visitante
    Posso fazer meu cadastro com email e senha
    Para que eu possa acessar minha agenda de contatos

    @logout
    Cenario: Cadastro simples

        Dado que eu acessei a pagina principal
        Quando faço meu cadastro com "eu@papito.io" e senha "abc123"
        Então sou autenticado com sucesso

    Cenario: Usuario já cadastrado

        Dado que eu acessei a pagina principal
        Quando faço meu cadastro usando um email já cadastrado
        Então vejo a mensagem de alerta "Você já está cadastrado."