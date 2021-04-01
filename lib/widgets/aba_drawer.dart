import 'package:calculo_combustivel/ui/functions.dart';
import 'package:flutter/material.dart';

class AbaDrawer {
  static Widget criarDrawer(BuildContext context, String titulo, List<Map> listaItens, Color corFundo, Color corTexto, {IconData iconeTitulo}) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Functions.criarIcone(iconeTitulo, cor: Colors.white, tamanho: 60),
                Text(titulo, style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
              ),
            decoration: BoxDecoration(color: corFundo),
          ),
          _criarListaItens(context, listaItens, corFundo)
    ],
      ),
    );
  }
  static Widget _criarListaItens(BuildContext context, List<Map> listaItens, Color corTexto) {
    var lista = List<Widget>();

    for (var item in listaItens) {
      Widget tile = _criarItem(context, item["nome"], item["icone"], corTexto, item["clique"]);
      lista.add(tile);
    }
    return Column(children: lista);
  }

  static Widget _criarItem(BuildContext context, String texto, IconData icone, Color cor, Function clique) {
    return ListTile(
      title: Row(
        children: [
          Functions.criarIcone(icone, tamanho: 28, cor: cor),
          Text(texto, style: TextStyle(fontSize: 10, color: cor)),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
        clique();
      }
    );
  }
}
