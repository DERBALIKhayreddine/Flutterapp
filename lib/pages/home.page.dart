import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _onLogout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to Home Page",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  Future<void> _onLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Connected", false);
    Navigator.pushNamedAndRemoveUntil(
        context, '/authentification', (route) => false);
  }
}
