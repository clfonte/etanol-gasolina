import 'package:calculo_combustivel/ui/functions.dart';
import 'package:calculo_combustivel/widgets/barra_titulo.dart';
import 'package:calculo_combustivel/widgets/botao.dart';
import 'package:calculo_combustivel/widgets/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {

  final nomeController     = TextEditingController();
  final emailController    = TextEditingController();
  final mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTitulo.criar("Contato", icone: Icons.mail_outline),
      body: ListView(
        children: [
          CampoTexto.criar("Nome", "", nomeController, TextInputType.text),
          CampoTexto.criar("E-mail", "", emailController, TextInputType.emailAddress),
          CampoTexto.criar("Mensagem", "", mensagemController, TextInputType.text),

          Column(
            children: [
              Botao.criar("Enviar", enviar, icone: Icons.send_rounded, tamanhoBotao: 180),
            ]
          )
        ],
      ) ,
    );
  }

  void enviar() async {
    String usuario = "kamila_fonte@hotmail.com";
    String senha   = "semsenha";

    final servidorSMTP = hotmail(usuario, senha);

    final mensagemEmail = Message()
    ..from("Contato via APP IOS", usuario)
    ..recipients.add(usuario)
    ..subject = "Enviado do meu aplicativo IOS"
    ..text = "Nome: ${nomeController.text}, E-mail: ${emailController.text}, Mensagem: ${mensagemController.text}";

    // send ja eh proprio do flutter
    // await para esperar o envio
    final emailEnviar = await send(mensagemEmail, servidorSMTP);

    setState(() {
      nomeController.text     = "";
      emailController.text    = "";
      mensagemController.text = "";
      Functions().mostrarMensagem(context, "Contato", "Confere o email la sis");
    });
  }
}
