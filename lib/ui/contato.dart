import 'package:calculo_combustivel/widgets/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
      appBar: AppBar( // nao colocar botao de açao dentro do appBar
        backgroundColor: Colors.teal,
        title: Text("Contato"),
      ),

      body: Column(
        children: [
          CampoTexto.criar("Nome", "", nomeController, TextInputType.text),
          CampoTexto.criar("E-mail", "", emailController, TextInputType.emailAddress),
          CampoTexto.criar("Mensagem", "", mensagemController, TextInputType.text),
        ],
      ) ,
    );
  }

}
