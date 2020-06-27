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
              ItemContagem(Contagem('teste', 0026)),
            ],
          ),
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
