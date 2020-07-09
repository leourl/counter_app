import 'package:counter_app/models/appbar.dart';
import 'package:counter_app/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      drawer: Menu(),
      body: Column(
        children: [
          counterCard(
        nomeContagem: 'teste',
        valorContagem: '0002',
      ),
      counterCard(
        nomeContagem: 'teste',
        valorContagem: '0002',
      ),
      counterCard(
        nomeContagem: 'teste',
        valorContagem: '0002',
      ),
      counterCard(
        nomeContagem: 'teste',
        valorContagem: '0002',
      ),
      counterCard(
        nomeContagem: 'teste',
        valorContagem: '0002',
      ),
        ],
      )
    );
  }
}

Widget counterCard({String nomeContagem, String valorContagem}) {
  return Card(
    child: ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          nomeContagem,
          style: TextStyle(color: Colors.black54),
        ),
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            valorContagem,
            style: TextStyle(fontSize: 56, fontFamily: 'Roboto'),
          ),
          Spacer(),
          counterCardIcons(),
        ],
      ),
    ),
  );
}

Widget counterCardIcons() {
  return Container(
    height: 70,
    padding: EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        IconButton(
          padding: EdgeInsets.only(bottom: 40, right: 25),
          color: Colors.blue[300],
          icon: Icon(
            Icons.remove,
            size: 56,
          ),
          onPressed: () {},
        ),
        VerticalDivider(),
        IconButton(
          padding: EdgeInsets.only(bottom: 40, right: 25),
          color: Colors.blue[300],
          icon: Icon(
            Icons.add,
            size: 56,
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
