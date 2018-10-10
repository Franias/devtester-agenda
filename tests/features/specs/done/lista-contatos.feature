#language: pt

@lista
Funcionalidade: Lista contatos
    Sendo um usuário que possuí contatos cadastrados
    Posso acessar a minha agenda
    Para que eu possa ver a minha lista de contatos

    @logout @smoke
    Cenario: Listar contatos

        Dado que estou autenticado com "papito@teste.com" e "abc123"
        E tenho a seguinte lista de contatos para cadastro:
            |nome          |email           |celular   |tipo     |
            |Perter Parker |peter@marvel.com|2199991001|SMS      |
            |Nick Fury     |nick@shield.com |2199991002|Telegram |
        Quando acesso a minha agenda
        Então devo ver estes registros na lista de contatos
    
    @logout @temp
    Cenario: Nenhum contato cadastrado

        Dado que estou autenticado com "papito@yahoo.com" e "abc123"
        E não possuo contatos cadastrados
        Quando acesso a minha agenda
        Então devo ver a mensagem "Nenhum contato encontrato."
