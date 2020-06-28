import 'dart:ui';

import 'package:counter_app/contagens.dart';
import 'package:flutter/material.dart';
import 'contagens.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TelaContagem(),
      ),
    );
  }
}

class TelaContagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text(""),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Nome_Contagem",
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            color: Colors.black87,
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "0026",
                  style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.share,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "compartilhar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 100,
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 350,
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListaContagem extends StatelessWidget {
  const ListaContagem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text(""),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Contagens",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 38,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: [
            ItemContagem(Contagem('teste_teste', 0026)),
          ],
        ),
      ),
    );
  }
}

class ItemContagem extends StatelessWidget {
  final Contagem _contagem;

  ItemContagem(this._contagem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _contagem.nome,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  _contagem.valor.toString(),
                  style: TextStyle(
                    fontSize: 52,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: IconButton(
                  color: Colors.blueAccent,
                  iconSize: 48,
                  icon: Icon(Icons.remove),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  color: Colors.blueAccent,
                  iconSize: 48,
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Contagem {
  final String nome;
  final int valor;

  Contagem(this.nome, this.valor);
}
