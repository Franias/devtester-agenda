#language: pt

@remover
Funcionalidade: Remover contatos
    Sendo um usuário cadastrado que possui contados indesejados
    Posso apagar um contato
    Para manter minha agenda organiza e atualizada

    Contexto:
        Dado que estou autenticado com "user3@teste.com" e "abc123"

    @logout
    Cenario: Excluir um contato

        E tenho a seguinte lista de contatos para cadastro:
            |nome           |email            |celular   |tipo     |
            |Fulano de Tal  |fulano@teste.com |4199991001|Whats    |
        Quando solicito a exclusão deste contato
            E confirmo a exclusão
        Então eu não devo ver este contato na minha agenda

    @logout
    Cenario: Desistir

        E tenho a seguinte lista de contatos para cadastro:
            |nome           |email            |celular   |tipo     |
            |Ciclano de Tal |ciclano@teste.com|3199991001|SMS      |
        Quando solicito a exclusão deste contato
            E desisto da exclusão
        Então este contato permanece na minha agenda
