# NOSQL ??? => MongoDB não relacional, desnormalizado

# Table => Collection
# Register => Document

require 'mongo'

client = Mongo::Client.new('mongodb://localhost:3001/meteor')
contatos = client[:contatos]
contatos.delete_many
