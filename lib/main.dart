import 'package:flutter/material.dart';

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
        body: ListView(
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nome_Contagem",
                            ),
                            Text("0026",
                                style: TextStyle(
                                    fontSize: 56, color: Colors.black87))
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 45),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 62,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 62,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
