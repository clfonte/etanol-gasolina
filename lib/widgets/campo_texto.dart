import 'package:flutter/material.dart';

class CampoTexto {
  static Widget criar(String texto, String prefixo, TextEditingController controller, TextInputType teclado) {
    return Container(
      //padding: EdgeInsets.all(40),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
          labelStyle: TextStyle(color: Colors.teal[600], fontSize: 25), // cor do nome do campo dentro dos labels
          prefixText: prefixo,
          prefixStyle: TextStyle(color: Colors.teal[600], fontSize: 25),
        ),
        style: TextStyle(color: Colors.teal[900], fontSize: 25),
        keyboardType: teclado,
      ),
    );
  }
}