import 'package:calculo_combustivel/ui/contato.dart';
import 'package:calculo_combustivel/ui/functions.dart';
import 'package:calculo_combustivel/widgets/barra_titulo.dart';
import 'package:calculo_combustivel/widgets/botao.dart';
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
  final etanolController = TextEditingController();
  final gasolinaController = TextEditingController();
  var resultado = "";

  @override
  Widget build(BuildContext context) {
    // opção de criar a barra de titulo e etc
    return Scaffold(
      appBar: BarraTitulo.criar("Etanol x Gasolina", iconeBotao: Icons.share, eventoClique: _compartilhar),
      floatingActionButton: Botao.botaoFlutuante(Icons.mail_outline, _abrirTelaContato),
      drawer: Drawer(),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CampoTexto.criar("Etanol", "R\$ ", etanolController, TextInputType.number),
          CampoTexto.criar("Gasolina", "R\$ ", gasolinaController, TextInputType.number),

          Column(
              children: [
                // botao("Calcular", calcular),
                Botao.criar("Calcular", calcular, icone: Icons.calculate, tamanhoBotao: 150),
                // botao("HI", textoHI),
                Botao.criar("Hi", textoHi, tamanhoBotao: 150),
              ],
          ),
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


  void calcular() {
    if (etanolController.text.isEmpty) {
      func.mostrarMensagem(context, "ATENÇÃO", "PREENCHER CAMPO ETANOL");
      return;
    }
    if (gasolinaController.text.isEmpty) {
      func.mostrarMensagem(context, "ATENÇÃO", "PREENCHER CAMPO GASOLINA");
      return;
    }

    double valorEtanol = double.parse(etanolController.text);
    double valorGasolina = double.parse(gasolinaController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = "Vai de etanol";
    }
    else {
      resultado = "Vai de gasolina";
    }
    setState(() {});

    func.mostrarMensagem(context, "Calculo concluido", resultado);
  }

  void _compartilhar() {
    Share.share("Etanol: " + etanolController.text + ", Gasolina: " +
        gasolinaController.text);
  }

  void _abrirTelaContato() {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Contato()
        ));
  }
}
