import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final double fontSize;

  CenteredMessage({
    this.message,
    this.icon,
    this.iconSize = 64,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: Icon(
                icon,
                size: iconSize,
              ),
              visible: icon != null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String ajustaValor(int valor) {
  if (valor.toString().length == 1) {
    return '000' + valor.toString();
  } else if (valor.toString().length == 2) {
    return '00' + valor.toString();
  } else if (valor.toString().length == 3) {
    return '0' + valor.toString();
  } else {
    return valor.toString();
  }
}
