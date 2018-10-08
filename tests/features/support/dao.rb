require 'mongo'

class DAO
  def busca_por_celular(celular)
    # no Ruby a última instrução do método retorna o resultado automaticamente
    contatos.find('celular' => celular).first
  end

  def busca_por_nome(nome)
    contatos.find('nome' => nome).first
  end

  def delete_por_celular(celular)
    contatos.delete_many('celular' => celular)
  end

  def limpa_contatos(email_usuario)
    u = usuarios.find('emails.address' => email_usuario).first
    contatos.delete_many('dono' => u[:_id])
  end

  private

  def conecta
    Mongo::Logger.logger = Logger.new('log/mongo.log')
    Mongo::Client.new('mongodb://localhost:3001/meteor')
  end

  def usuarios
    conecta[:users]
  end

  def contatos
    conecta[:contatos]
  end
end
