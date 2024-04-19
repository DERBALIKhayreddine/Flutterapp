import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaysDetails extends StatefulWidget {
  final String keyword;
  PaysDetails(this.keyword);

  @override
  State<PaysDetails> createState() => _PaysDetailsState();
}

class _PaysDetailsState extends State<PaysDetails> {
  var paysData;

  @override
  void initState() {
    super.initState();
    getCountryData(widget.keyword);
  }

  void getCountryData(String ville) async {
    try {
      var response =
          await http.get(Uri.parse("https://restcountries.com/v2/name/$ville"));
      if (response.statusCode == 200) {
        var decodedResponse = utf8.decode(response.bodyBytes);
        setState(() {
          paysData = json.decode(decodedResponse);
        });
      } else {
        throw Exception('Failed to load country data');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Détails Pays ${widget.keyword}'),
        backgroundColor: Colors.amber,
      ),
      body: paysData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                SizedBox(
                  height: 2,
                ),
                Image.network(paysData[0]['flags']['png']),
                Column(
                  children: [
                    Text(
                      paysData[0]['name'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      paysData[0]['nativeName'],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Text(
                      'Administration',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Capitale:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(paysData[0]['capital']),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Langage(s):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(paysData[0]['languages'][0]['name'] ?? ''),
                        Text(
                            ' , ${paysData[0]['languages'][0]['nativeName'] ?? ''}'),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          'Géographie',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Région:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(paysData[0]['region']),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Superficie:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(paysData[0]['area'].toString()),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Fuseau Horaire:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(paysData[0]['timezones'][0]),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Text(
                              'Démographie:',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Population:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(paysData[0]['population'].toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
