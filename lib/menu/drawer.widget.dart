import 'package:firebase_auth/firebase_auth.dart';
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
            title: Text('meteo', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.cloud_circle_outlined,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/meteo');
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          ),
          ListTile(
            title: Text('gallerie', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.image,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallerie');
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          ),
          ListTile(
            title: Text('payes', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.flag,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/payes');
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          ),
          ListTile(
            title: Text('contact', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.person,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          ),
          ListTile(
            title: Text('parameter', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.settings,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/parameter');
            },
          ),
          Divider(
            height: 4,
            color: Colors.amber,
          ),
          ListTile(
            title: Text('Logout', style: TextStyle(fontSize: 22)),
            leading: Icon(
              Icons.logout,
              color: Colors.amber,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () async {
              try {
                await FirebaseAuth.instance.signOut();
                prefs = await SharedPreferences.getInstance();
                prefs.setBool("connected", false);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/authentification', (route) => false);
              } catch (e) {
                // Handle errors if any
                print("Error logging out: $e");
              }
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
