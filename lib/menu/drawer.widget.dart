import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;
  MyDrawer({Key? key}) : super(key: key); // Removed 'const' keyword
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.amber],
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/img.jpg"),
                radius: 80,
              ),
            ),
          ),
          ListTile(
            title: Text('Acceuil', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          ),
          ListTile(
            title: Text('logout', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.logout,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () async {
              prefs = await SharedPreferences.getInstance();
              prefs.setBool("connecte", false);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/authentification', (route) => false);
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
