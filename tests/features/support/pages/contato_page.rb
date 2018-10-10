# Page Object

class ContatoPage
  include Capybara::DSL
  def visita
    visit '/'
  end

  def salvar(contato)
    find('#nome').set contato[:nome]
    find('input[id*=txtEmail]').set contato[:email]
    find('#celular').set contato[:celular]

    if contato[:tipo] != ''
      tipo_contato = find('#tipo')
      tipo_contato.find('option', text: contato[:tipo]).select_option
    end

    click_on 'Adicionar Contato'
  end

  def titulo
    find('section[id=meusContatos] h4').text
  end

  def remover(celular)
    find('tr', text: celular).find('#deletarContato').click
  end

  def confirma_modal
    find('.swal2-confirm').click
  end

  def cancela_modal
    find('.swal2-cancel').click
  end

  def msg_alert_box
    find('.s-alert-box')
  end

  def fecha_salert
    find('.s-alert-close').click
  end

  def msg_alert_info
    find('.alert').text
  end

  def retorna_trs
    all('.table tr')
  end
end
