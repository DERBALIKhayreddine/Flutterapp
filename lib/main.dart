import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstapplication/pages/Inscription.page.dart';
import 'package:firstapplication/pages/authentification.page.dart';
import 'package:firstapplication/pages/home.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => Authentification(),
    '/home': (context) => HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is loading
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            // If an error occurs
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            // Data loaded successfully
            bool conn = snapshot.data?.getBool('connected') ?? false;
            if (conn) {
              return HomePage();
            } else {
              return Authentification();
            }
          }
        },
      ),
    );
  }
}
