import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class PrameterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Parameter"),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: Center(
        child: Text(
          "Parameter",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
