class AcessoPage
  include Capybara::DSL

  def acessa
    visit 'http://localhost:3000'
  end

  def logar(email, senha)
    within('form[id=login]') do
      fill_in 'loginEmail', with: email
      fill_in 'loginSenha', with: senha
      click_button 'Entrar'
    end
  end
end
