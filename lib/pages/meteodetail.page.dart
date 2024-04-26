import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../menu/drawer.widget.dart';

class MeteoDetailPage extends StatefulWidget {
  String ville = "";
  MeteoDetailPage(this.ville);

  @override
  State<MeteoDetailPage> createState() => _MeteoDetailPageState();
}

class _MeteoDetailPageState extends State<MeteoDetailPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    print("Meteo de la ville de" + ville);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${ville}&appid=d0670e1d89c523185cab69b9b70681b2";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(this.meteoData);
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Page Meteo Details ${widget.ville}"),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: meteoData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: (meteoData == null ? 0 : meteoData['list'].length),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amber[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${new DateFormat('E-dd//MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "${(meteoData['list'][index]['main']['temp'] / 10).toStringAsFixed(1)}°C",
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
