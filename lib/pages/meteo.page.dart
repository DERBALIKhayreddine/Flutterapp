import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class MeteoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Meteo"),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: Center(
        child: Text(
          "Meteo",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
