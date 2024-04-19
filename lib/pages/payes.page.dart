import 'package:firstapplication/pages/paysdetails.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/drawer.widget.dart';

class PayesPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController textPays = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: textPays, // Changed variable name
                decoration: InputDecoration(
                    prefix: Icon(Icons.map),
                    hintText: "Pays",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 5))),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  onPressed: () => _openPaysDetail(context), // Renamed method
                  child: Text("chercher"),
                ))
          ],
        ),
      ),
    );
  }

  void _openPaysDetail(BuildContext context) async {
    String v = textPays.text;
    if (textPays.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PaysDetails(v)));
      textPays.text = "";
    } else {
      // Changed Snackbar to SnackBar
      const snackBar = SnackBar(
        content: Text('Champs vide'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
