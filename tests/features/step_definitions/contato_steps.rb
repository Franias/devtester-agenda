Dado('que estou autenticado com {string} e {string}') do |email, senha|

  novo_usuario_api(email, senha)

  @acesso_page.acessa
  @acesso_page.logar(email, senha)
  expect(@contato_page.titulo).to eql 'Meus Contatos'
  @email_usuario = email
  @contato_page.fecha_salert
end

Dado('que possuo o seguinte contato:') do |table|
  @novo_contato = table.rows_hash
end

Dado('já existe um contato cadastrado com este celular') do
  @contato_page.visita
  @contato_page.salvar(@novo_contato)
end

Quando('faço o cadastro deste novo contato') do
  @contato_page.visita
  @contato_page.salvar(@novo_contato)
end

Quando('faço o cadastro dos seguintes contatos:') do |table|
  @contatos = table.hashes

  @alertas = []

  @contatos.each do |c|
    @contato_page.salvar(c)
    @alertas.push(@contato_page.msg_alert_box.text)
    @contato_page.fecha_salert
  end
end

Então('devo ver a mensagem de alerta {string}') do |mensagem|
  expect(@contato_page.msg_alert_box).to have_content mensagem
end

Então('este contato não deve ser inserido no banco de dados') do
  res = DAO.new.busca_por_celular(@novo_contato[:celular])

  expect(res).to be_nil
end

Então('devo ver {string} como mensagem de alerta') do |msg_alerta|
  @alertas.each do |a|
    expect(a).to eql msg_alerta
  end
end

# Lista

Dado('tenho a seguinte lista de contatos para cadastro:') do |table|
  @lista_contato = table.hashes

  @contato_page.visita

  @lista_contato.each do |contato|
    @contato_page.salvar(contato)
  end
end

Dado('não possuo contatos cadastrados') do
  DAO.new.limpa_contatos(@email_usuario)
end

Quando('acesso a minha agenda') do
  @contato_page.visita
end

Quando('solicito a exclusão deste contato') do
  @celular = @lista_contato.first[:celular]
  @contato_page.remover(@celular)
end

Quando('confirmo a exclusão') do
  @contato_page.confirma_modal
end

Quando('desisto da exclusão') do
  @contato_page.cancela_modal
end

Então('devo ver estes registros na lista de contatos') do
  trs = @contato_page.retorna_trs

  @lista_contato.each_with_index do |v, i|
    expect(trs[i]).to have_content v[:nome]
    expect(trs[i]).to have_content v[:email]
    expect(trs[i]).to have_content v[:celular]
    expect(trs[i]).to have_content v[:tipo]
  end

  expect(true).to eql false
end

Então('devo ver a mensagem {string}') do |msg_alerta|
  expect(@contato_page.msg_alert_info).to eql msg_alerta
end

Então('eu não devo ver este contato na minha agenda') do
  res = DAO.new.busca_por_celular(@celular)
  expect(res).to be_nil
end

Então('este contato permanece na minha agenda') do
  res = DAO.new.busca_por_celular(@celular)
  expect(res[:celular]).to eql @celular
end
