import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController text_login = TextEditingController();
    TextEditingController text_mdp = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Authentification"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: text_login,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Identifiant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 5),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: text_mdp,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock), // Changed icon to lock
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 5),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.amber,
              child: ElevatedButton(
                onPressed: () {
                  _onAuthentifier(context, text_login.text, text_mdp.text);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                child: Text("Connection"),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/inscription');
                },
                child: Text("Nouvel Utilisateur"))
          ],
        ),
      ),
    );
  }
}

Future<void> _onAuthentifier(
    BuildContext context, String login, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String log = prefs.getString("login") ?? '';
  String psw = prefs.getString("password") ?? '';
  if (login == log && password == psw) {
    prefs.setBool("connected", true); // Fixed typo and added semicolon
    Navigator.pop(context);
    Navigator.pushNamed(context, '/home');
  } else {
    const snackBar = SnackBar(
      content: Text('ID or password is empty'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
