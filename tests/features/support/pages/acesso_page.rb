class AcessoPage
  include Capybara::DSL

  def acessa
    visit '/'
  end

  def logar(email, senha)
    within('form[id=login]') do
      fill_in 'loginEmail', with: email
      fill_in 'loginSenha', with: senha
      click_button 'Entrar'
    end
  end
end
