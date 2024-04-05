import 'package:firstapplication/pages/meteodetail.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/drawer.widget.dart';

class MeteoPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController text_meteo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Meteo"),
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
                controller: text_meteo,
                decoration: InputDecoration(
                    prefix: Icon(Icons.cloud),
                    hintText: "Ville",
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
                  // Changed onPressed to directly call _onInscrire method
                  onPressed: () => _openMeteoDetail(context),
                  child: Text("Voir Ville"),
                ))
          ],
        ),
      ),
    );
  }

  void _openMeteoDetail(BuildContext context) async {
    String v = text_meteo.text;
    if (text_meteo.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MeteoDetailPage(v)));
      text_meteo.text = "";
    } else {
      // Changed Snackbar to SnackBar
      const snackBar = SnackBar(
        content: Text('Champs vide'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
