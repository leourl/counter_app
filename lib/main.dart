import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            IconButton(
              icon: Icon(
                Icons.add_circle,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Text("teste"),
      ),
    );
  }
}
