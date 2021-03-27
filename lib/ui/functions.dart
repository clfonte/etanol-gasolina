import 'package:flutter/material.dart';

class Functions {
  static Widget _criarIconeEspacado(IconData icone) {
    return Padding(padding: EdgeInsets.all(4),
     child: Icon(icone),
    );
  }
  
  static Widget criarIcone(IconData icone) {
    return icone != null ? _criarIconeEspacado(icone) : Container();
  }
  
  // tela que vai mostrar
  void mostrarMensagem(BuildContext context, String tituloAlerta, String mensagemAlerta) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(tituloAlerta),
            content: Text(mensagemAlerta),
            actions: [
              ElevatedButton(
                  child: Text("OK"),
                  onPressed: () {
                    _fecharTela(context);
                  },
              ),
          ],
      );
    });
  }

  // _ pois significa que é metodo private
  void _fecharTela(BuildContext context) {
    // fecha a tela atual
    Navigator.pop(context);
  }
}