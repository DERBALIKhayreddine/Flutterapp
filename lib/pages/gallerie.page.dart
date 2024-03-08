import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class GalleriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Gallerie"),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: Center(
        child: Text(
          "Gallerie",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
