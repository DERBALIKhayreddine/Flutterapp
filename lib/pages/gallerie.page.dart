import 'package:firstapplication/pages/galleriedetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/drawer.widget.dart';

class GalleriePage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController textGallerie =
      TextEditingController(); // Changed variable name
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
                controller: textGallerie, // Changed variable name
                decoration: InputDecoration(
                    prefix: Icon(Icons.image),
                    hintText: "Keyword",
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
                  onPressed: () =>
                      _openGallerieDetail(context), // Renamed method
                  child: Text("chercher"),
                ))
          ],
        ),
      ),
    );
  }

  void _openGallerieDetail(BuildContext context) async {
    String v = textGallerie.text;
    if (textGallerie.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GallerieDetails(v)));
      textGallerie.text = "";
    } else {
      // Changed Snackbar to SnackBar
      const snackBar = SnackBar(
        content: Text('Champs vide'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
