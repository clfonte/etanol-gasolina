import 'package:calculo_combustivel/ui/contato.dart';
import 'package:calculo_combustivel/ui/functions.dart';
import 'package:calculo_combustivel/widgets/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

// controles de estados e tela visual
// stf - cria escopo
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var func = Functions();
  // declarar os campos que vao controlar os valores
  final etanolController   = TextEditingController();
  final gasolinaController = TextEditingController();
  var resultado = "";

  @override
  Widget build(BuildContext context) {
    // opção de criar a barra de titulo e etc
    return Scaffold(
      appBar: AppBar( // nao colocar botao de açao dentro do appBar
        backgroundColor: Colors.teal,
        title: Text("Etanol x Gasolina"),
        actions: [
          IconButton(icon: Icon(Icons.share),
          onPressed: _compartilhar,
          ),
        ],
      ),

      // botao do carrinho
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[500],
        child: Icon(Icons.mail_outline_rounded, color: Colors.white),
        onPressed: _abrirTelaContato,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         CampoTexto.criar("Etanol", "R\$ ", etanolController, TextInputType.number),
          CampoTexto.criar("Etanol", "R\$ ", gasolinaController, TextInputType.number),

          // botao("Calcular", calcular),
          botao("Calcular", calcular),
          // botao("HI", textoHI),
          botao("Hi", textoHi),

          Text("Resultado: " + resultado)
        ],
      ),
    );
  }

  void textoHi() {
    func.mostrarMensagem(context, "Enhai bichaaaaa", "Fala yag");
    setState(() {
      resultado = "Enhai";
    });
  }

  Widget botao(String texto, Function clique) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 25),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.teal,
          onPressed: clique,
        ),
      ],
    );
  }

  void calcular() {
    if (etanolController.text.isEmpty) {
      func.mostrarMensagem(context, "ATENÇÃO", "PREENCHER CAMPO ETANOL");
      return;
    }
    if (gasolinaController.text.isEmpty) {
      func.mostrarMensagem(context, "ATENÇÃO", "PREENCHER CAMPO GASOLINA");
      return;
    }

    double valorEtanol   = double.parse(etanolController.text);
    double valorGasolina = double.parse(gasolinaController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = "Vai de etanol";
    }
    else {
      resultado = "Vai de gasolina";
    }
    setState(() { });

    func.mostrarMensagem(context, "Calculo concluido", resultado);
  }

  void _compartilhar() {
    Share.share("Etanol: " + etanolController.text + ", Gasolina: " + gasolinaController.text);
  }

  void _abrirTelaContato() {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Contato()
    ));
  }
}
