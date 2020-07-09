import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCounter extends AppBar {
  final String pageTitle;
  final List<Widget> actions;

  AppBarCounter({this.pageTitle, this.actions})
      : super(
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              pageTitle,
              style: TextStyle(color: Colors.black87),
            ),
            actions: actions);
}

class AppBarHome extends AppBarCounter {
  AppBarHome()
      : super(
          pageTitle: 'Contagens',
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 15),
              color: Colors.black87,
              icon: Icon(
                Icons.add_circle,
                color: Colors.blue[300],
                size: 42,
              ),
              onPressed: () {},
            ),
          ],
        );
}
