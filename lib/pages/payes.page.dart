import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class PayesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Payes"),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: Center(
        child: Text(
          "Payes",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
