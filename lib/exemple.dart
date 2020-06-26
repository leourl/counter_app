import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(new ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new ListaScreen());
  }
}

class ListaScreen extends StatelessWidget {
  List<Tarefa> tarefas = new List<Tarefa>();

  void adicionaTarefa(String nome) {
    tarefas.add(Tarefa(nome));
  }

  Widget getItem(Tarefa tarefa) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: new Icon(
            Icons.check_box,
            color: Colors.green,
          ),
          iconSize: 42.0,
          onPressed: () {},
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tarefa.nome,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(tarefa.data.toIso8601String()),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista de Tarefas"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) {
                  adicionaTarefa(value);
                },
              )),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (_, indice) {
                return getItem(tarefas[indice]);
              },
            ),
          )
        ],
      ),
    );
  }
}
