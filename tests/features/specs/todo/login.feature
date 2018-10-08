#language: pt

@todo
Funcionalidade: Login
    Sendo um usuário já cadastrado
    Posso acessar o sistema com email e senha
    Para que somente eu possa ver meus contatos e gerenciar minha agenda

    Cenario: Login do usuário

        Dado que eu acessei a pagina principal
        Quando faço login com "eu@papito.io" e senha "abc123"
        Então sou autenticado com sucesso

    Cenario: Email não cadastrado

        Dado que eu acessei a pagina principal
        Quando faço login com email não cadastrado
        Então vejo a mensagem de alerta "Email e ou senha incorretos."

    Cenario: Senha inválida

        Dado que eu acessei a pagina principal
        Quando faço login com senha incorreta
        Então vejo a mensagem de alerta "Email e ou senha incorretos."