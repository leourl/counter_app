import 'package:counter_app/database/counters.dart';
import 'package:counter_app/models/appbar.dart';
// import 'package:counter_app/models/menu.dart';
import 'package:counter_app/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> data;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    return Scaffold(
      appBar: appBarHomeScreen(context: context),
      key: _scaffoldKey,
      // drawer: Menu(),
      body: _homeCards(),
    );
  }

  Widget _homeCards() {
    try {
      if (data[0]['id'] > 0) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _counterCard(
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

  Widget _counterCard({String nomeContagem, int valorContagem, int counterID}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/counter', arguments: {'id': counterID})
            .then((value) => fetchData());
      },
      child: Slidable(
        key: Key(counterID.toString()),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: _counterCardData(
            nomeContagem: nomeContagem,
            valorContagem: valorContagem,
            counterID: counterID),
        dismissal: SlidableDismissal(
            child: SlidableDrawerDismissal(),
            onDismissed: (actionType) {
              if (actionType == SlideActionType.secondary) {
                deleteCounters(id: counterID);
                deletedItemSnackBar(
                    counterId: counterID, counterName: nomeContagem);
              }
              fetchData();
            }),
        secondaryActions: <Widget>[
          _deleteCounterCardIcon(counterName: nomeContagem, id: counterID),
        ],
      ),
    );
  }

  Widget _deleteCounterCardIcon({String counterName, int id}) {
    return IconSlideAction(
        caption: 'Remove',
        color: Colors.red[600],
        icon: Icons.delete,
        onTap: () {
          deleteCounters(id: id);
          deletedItemSnackBar(counterId: id, counterName: counterName);
          fetchData();
        });
  }

  Widget _counterCardData(
      {String nomeContagem, int valorContagem, int counterID}) {
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
              ajustaValor(valorContagem),
              style: TextStyle(fontSize: 56, fontFamily: 'Roboto'),
            ),
            Spacer(),
            _counterCardIcons(
              counterID: counterID,
              valorContagem: valorContagem,
            ),
          ],
        ),
      ),
    );
  }

  Widget _counterCardIcons({int counterID, int valorContagem}) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.only(bottom: 40, right: 40),
            color: Colors.blue[300],
            icon: Icon(
              Icons.remove,
              size: 60,
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
            padding: EdgeInsets.only(bottom: 40, right: 35),
            color: Colors.blue[300],
            icon: Icon(
              Icons.add,
              size: 60,
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

  void deletedItemSnackBar({String counterName, int counterId}) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('$counterName removido'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            recoverCounters(id: counterId);
            fetchData();
          },
        ),
      ),
    );
  }
}
