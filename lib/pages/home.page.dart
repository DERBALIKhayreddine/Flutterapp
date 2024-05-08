import 'package:firebase_auth/firebase_auth.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: FirebaseAuth.instance.authStateChanges().first,
              builder: (context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Loading indicator
                } else {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Text(
                      'Welcome, ${snapshot.data!.email}',
                      style: TextStyle(fontSize: 18),
                    );
                  } else {
                    return Text(
                      'Welcome', // Show a generic welcome message if user is not logged in
                      style: TextStyle(fontSize: 18),
                    );
                  }
                }
              },
            ),
            SizedBox(height: 20),
            Wrap(
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
          ],
        ),
      ),
    );
  }
}
