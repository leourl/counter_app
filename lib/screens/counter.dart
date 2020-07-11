import 'package:counter_app/database/counters.dart';
import 'package:counter_app/models/appbar.dart';
import 'package:counter_app/models/utils.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  List<Map<String, dynamic>> data;

  void fetchData(arguments) async {
    List<Map<String, dynamic>> _data;

    if (arguments['id'] == 0) {
      _data = await setNewCounter();
    } else {
      _data = await getCountersByID(arguments['id']);
    }

    setState(() {
      data = _data;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final Map<String, dynamic> arguments =
          ModalRoute.of(context).settings.arguments;
      fetchData(arguments);
    });
  }

  @override
  Widget build(BuildContext context) {

    try {
      if (data[0]['id'] > 0) {
        return Scaffold(
            appBar: AppBarCounterScreen(
              counterID: data[0]['id'],
              context: context
            ),
            body: _body());
      } else {
        return Scaffold(
          body: CenteredMessage(
              message: 'Erro para localizar os valores!', icon: Icons.warning),
        );
      }
    } catch (e) {
      print('except -> $e');
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.blueAccent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )),
      );
    }
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _counterValue(value: data[0]['value']),
          _shareCounter(),
          _counterIcons(counterID: data[0]['id'] , valorContagem: data[0]['value'] ),
        ],
      ),
    );
  }

  Widget _counterValue({@required int value}) {
    return Text(
      ajustaValor(value),
      style: TextStyle(
        fontSize: 120,
        fontWeight: FontWeight.w300,
        color: Colors.black87,
      ),
    );
  }

  Widget _shareCounter() {
    return OutlineButton(
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
    );
  }

  Widget _counterIcons({int counterID, int valorContagem}) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                if (valorContagem > 0) {
                  updateCounter(
                    valor: valorContagem - 1,
                    id: counterID,
                  );
                  fetchData({'id': counterID});
                }
              },
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
                onPressed: () {
                  updateCounter(
                    valor: valorContagem + 1,
                    id: counterID,
                  );
                  fetchData({'id': counterID});
                },
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
    );
  }
}
