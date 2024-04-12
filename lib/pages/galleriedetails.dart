import 'dart:convert';

import 'package:firstapplication/menu/drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GallerieDetails extends StatefulWidget {
  final String keyword;
  GallerieDetails(this.keyword);

  @override
  State<GallerieDetails> createState() => _GallerieDetailsState();
}

class _GallerieDetailsState extends State<GallerieDetails> {
  var galleryData;
  int currentPage = 1;
  int size = 10;
  int? totalPages;
  ScrollController _scrollController = ScrollController();
  List<dynamic> hits = [];

  @override
  void initState() {
    super.initState();
    getGallerieData(widget.keyword);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages!) {
          currentPage++;
          getGallerieData(widget.keyword);
        }
      }
    });
  }

  void getGallerieData(String keyword) {
    String url =
        "https://pixabay.com/api/?key=43354589-4fe33ea0874fb6a7a7cf9c6bf&q=${keyword}&page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then(
          (resp) => setState(() {
            this.galleryData = json.decode(resp.body);
            hits.addAll(galleryData['hits']);
            totalPages = (galleryData['totalHits'] / size).ceil();
          }),
          onError: (error) => print(error),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: totalPages == null
            ? Text('Loading...')
            : totalPages == 0
                ? Text('Pas de résultats')
                : Text(
                    "${widget.keyword}, Page ${currentPage}/${totalPages}",
                  ),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: galleryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: hits.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                var tags = hits[index]['tags'].toString().split(",");
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: tags
                                .map(
                                  (tag) => Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      tag.trim(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Image.network(
                          hits[index]['webformatURL'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                  ],
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
