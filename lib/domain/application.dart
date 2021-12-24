import 'package:flutter/material.dart';
import 'package:pin_screen_test/presentation/screens/authentication_screen.dart';
import 'package:pin_screen_test/presentation/screens/create_pin_screen.dart';
import 'package:pin_screen_test/presentation/screens/menu_screen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/createPin': (context) => CreatePinScreen(),
      },
    );
  }
}
