import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  // Added late modifier to SharedPreferences prefs to initialize it later
  late SharedPreferences prefs;
  // Moved TextEditingController initialization outside the build method
  TextEditingController text_login = TextEditingController();
  TextEditingController text_mdp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
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
                        borderSide: BorderSide(width: 5))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: text_mdp,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 5))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.amber,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                // Changed onPressed to directly call _onInscrire method
                onPressed: () => _onInscrire(context),
                child: Text("Inscription"),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/authentification');
                },
                child: Text("J'ai déjà un compte"))
          ],
        ),
      ),
    );
  }

  // Moved _onInscrire method inside the InscriptionPage class
  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    // Changed .empty to .isEmpty for checking text emptiness
    if (text_login.text.isNotEmpty && text_mdp.text.isNotEmpty) {
      // Changed text_password to text_mdp to match the controller name
      prefs.setString("login", text_login.text);
      prefs.setString("password", text_mdp.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      // Changed Snackbar to SnackBar
      const snackBar = SnackBar(
        content: Text('ID or password is empty'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
