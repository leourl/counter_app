import 'dart:developer';

import 'package:counter_app/database/counters.dart';
import 'package:counter_app/models/appbar.dart';
import 'package:counter_app/models/menu.dart';
import 'package:counter_app/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> data;

  void fetchData() async {
    var _data = await getCounters();
    setState(() {
      data = _data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarHome(), drawer: Menu(), body: homeCards());
  }

  Widget homeCards() {
    try {
      if (data[0]['id'] > 0) {
        print(data[0]);

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return counterCard(
              nomeContagem: data[index]['name'],
              valorContagem: data[index]['value'],
              counterID: data[index]['id'],
            );
          },
        );
      } else {
        return CenteredMessage(
            message: 'Erro para localizar os valores!', icon: Icons.warning);
      }
    } catch (e) {
      print('except -> $e');
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.blueAccent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ));
    }
  }


Widget counterCard({String nomeContagem, int valorContagem, int counterID}) {
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
            _ajustaValor(valorContagem),
            style: TextStyle(fontSize: 56, fontFamily: 'Roboto'),
          ),
          Spacer(),
          counterCardIcons(
            counterID: counterID,
            valorContagem: valorContagem,
          ),
        ],
      ),
    ),
  );
}

String _ajustaValor(int valor) {
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

Widget counterCardIcons({int counterID, int valorContagem}) {
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
          onPressed: () {
            if (valorContagem > 0) {
              updateCounter(
                valor: valorContagem - 1,
                id: counterID, 
              );
              fetchData();
            }
          },
        ),
        VerticalDivider(),
        IconButton(
          padding: EdgeInsets.only(bottom: 40, right: 25),
          color: Colors.blue[300],
          icon: Icon(
            Icons.add,
            size: 56,
          ),
          onPressed: () {
            updateCounter(
                valor: valorContagem + 1,
                id: counterID,
              );
              fetchData();
          },
        ),
      ],
    ),
  );
}
}