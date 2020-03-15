import 'package:flutter/material.dart';
import 'package:providerarch/locator.dart';
import 'package:providerarch/routers.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: 'login',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
