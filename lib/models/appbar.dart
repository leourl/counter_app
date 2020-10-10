import 'package:counter_app/database/counters.dart';
import 'package:counter_app/models/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBarHomeScreen({@required BuildContext context}) {
  return AppBar(
    // iconTheme: IconThemeData(color: Colors.black87),
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      appText.listTitle,
      style: TextStyle(color: Colors.black87),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.only(right: 15),
        color: Colors.black87,
        icon: Icon(
          Icons.add_circle,
          color: Colors.blue[300],
          size: 42,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/counter', arguments: {'id': 0}).then(
              (value) => Navigator.pushReplacementNamed(context, '/home'));
        },
      ),
    ],
  );
}

class AppBarCounterScreen extends StatefulWidget with PreferredSizeWidget {
  final BuildContext context;
  final int counterID;

  const AppBarCounterScreen({Key key, this.context, this.counterID})
      : super(key: key);

  @override
  _AppBarCounterScreenState createState() => _AppBarCounterScreenState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarCounterScreenState extends State<AppBarCounterScreen> {
  List<Map<String, dynamic>> data;

  TextEditingController _countername = TextEditingController();

  void fetchTitle() async {
    List<Map<String, dynamic>> _data = await getCountersByID(widget.counterID);

    setState(() {
      data = _data;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      fetchTitle();
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          data[0]['name'],
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            color: Colors.black87,
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () {
              _editCounterName();
            },
          ),
        ],
      );
    } catch (e) {
      print('except -> $e');
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.blueAccent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ));
    }
  }

  _errorAlert() {
    return showDialog(
      context: context,
      child: AlertDialog(
          title: Text(appText.editNameErrorName),
          content: Text(appText.editNameErrorText),
          actions: [
            FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ]),
    );
  }

  _editCounterName() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(appText.editNameText),
            content: TextField(
              decoration: InputDecoration(hintText: appText.counterDefaultName),
              controller: _countername,
            ),
            actions: [
              FlatButton(
                child: Text(appText.save),
                onPressed: () {
                  if (_countername.text.isEmpty) {
                    _errorAlert();
                  } else {
                    updateCounterName(
                        name: _countername.text, id: widget.counterID);
                    Navigator.pop(context);
                    fetchTitle();
                  }
                },
              ),
              FlatButton(
                child: Text(appText.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
