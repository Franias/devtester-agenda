import { Meteor } from "meteor/meteor";
import { onPageLoad } from "meteor/server-render";
import { Mongo } from 'meteor/mongo';

Meteor.startup(() => {

  const Contato = new Mongo.Collection('contatos');

  Meteor.methods({
    'inserirContato'(contato) {

     

      var usuario = Meteor.user();

      var existe = Contato.findOne({celular: contato.celular, dono: usuario._id});

      contato.dono = usuario._id;

      if (existe) {
        throw new Meteor.Error(409, "Contato já cadastrado.")
      } else {
        Contato.insert(contato);
      }
    },
    'removerContato'(contatoId) {
      return Contato.remove({_id: contatoId});
    }
  });

});

onPageLoad(sink => {
  // Code to run on every request.
  sink.renderIntoElementById(
    "server-render-target",
    `Server time: ${new Date}`
  );
});
