import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/meteo');
              },
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/meteo.png'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/contact.png'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/payes');
              },
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/pays.png'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/parameter');
              },
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/parametres.png'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/gallerie');
              },
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/gallerie.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
