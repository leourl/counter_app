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
        body: new Container(
          color: Colors.grey[200],
          child: ListView(
            children: [
              Contagem(),
              Contagem(),
              Contagem(),
              Contagem(),
            ],
          ),
        ),
      ),
    );
  }
}

class Contagem extends StatelessWidget {
  const Contagem({
    Key key,
  }) : super(key: key);

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
                  "Nome Transferencia",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "0026",
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
