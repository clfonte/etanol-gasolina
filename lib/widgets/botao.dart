import 'dart:ffi';

import 'package:calculo_combustivel/ui/functions.dart';
import 'package:flutter/material.dart';

class Botao {
  static Widget criar(String texto, Function clique, {IconData icone, double tamanhoBotao = 150.0, Color cor = Colors.teal}) {
    //return Row(
    //mainAxisAlignment: MainAxisAlignment.center,
    //children: <Widget>[
    return ElevatedButton(
      child: Container(
        width: tamanhoBotao,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Functions.criarIcone(icone),
            Text(texto, style: TextStyle(color: Colors.white, fontSize: 25),)
          ],
        ),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(cor)),
      onPressed: clique,
    );
    // recortei o raised
  }

  // botao barra
  static Widget botaoCompartilhar(IconData icone, Function evento) {
    return IconButton(
      icon: Functions.criarIcone(icone),
      onPressed: evento,
    );
  }

  static Widget botaoFlutuante(IconData icone, Function evento) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      child: Functions.criarIcone(icone),
      onPressed: evento,
    );
  }
}

// --------------------------------------------------------------------------------
/* RaisedButton(
          child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 25),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.teal,
        ),
      ],
    ); */