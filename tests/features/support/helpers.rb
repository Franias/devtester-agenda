require 'httparty'

module Helpers
  def novo_usuario_api(email, senha)
    @api_uri = 'https://devtester-agenda-api.herokuapp.com/api'
    HTTParty.delete(@api_uri + "/users/#{email}")

    @body = {
      name: 'Fernando',
      email: email,
      password: senha
    }

    HTTParty.post(
      @api_uri + '/users',
      body: @body.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
