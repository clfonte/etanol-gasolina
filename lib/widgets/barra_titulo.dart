import 'package:calculo_combustivel/ui/functions.dart';
import 'package:calculo_combustivel/widgets/botao.dart';
import 'package:flutter/material.dart';

class BarraTitulo {
  static Widget criar(String titulo, {IconData icone, IconData iconeBotao, Function eventoClique, tituloCentralizado = true}) {
    return AppBar( // nao colocar botao de açao dentro do appBar
      backgroundColor: Colors.teal,
      title: Row (
        children: [
          Functions.criarIcone(icone),
          Text(titulo),
        ],
      ),
      // centralizar o titulo do appbar
      centerTitle: tituloCentralizado,
      actions: [
        _criarBotao(iconeBotao, eventoClique),
      ],
    );
  }

  static Widget _criarBotao(IconData iconeBotao, Function eventoClique) {
    return iconeBotao != null ? Botao.botaoCompartilhar(iconeBotao, eventoClique) : Container();
  }
}