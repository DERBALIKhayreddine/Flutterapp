import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class ContactePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: Center(
        child: Text(
          "Contact",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
