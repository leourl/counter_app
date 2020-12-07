import 'package:counter_app/screens/counter.dart';
import 'package:counter_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  runApp(CounterAPP());
}

class CounterAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        initialRoute: '/splash',
        routes: {
          '/splash': (BuildContext context) => SplashScreen(),
          '/home': (BuildContext context) => HomeScreen(),
          '/counter': (BuildContext context) => CounterScreen()
        },
        debugShowCheckedModeBanner: false
      );
  }
}