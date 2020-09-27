import 'dart:convert';

import 'package:corona_tracking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var _data;
  bool _isLoading = true;

  Future<void> getNews() async {
    String url = "https://nepalcorona.info/api/v1/news";
    var _response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    _data = json.decode(_response.body)['data'];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News and Updates'),
      ),
      body: _isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: CustomText(
                          text: _data[index]['title'],
                          size: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: CustomText(text: _data[index]['summary']),
                        onTap: () {
                          launch(_data[index]['url']);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(_data[index]['image_url'].toString()),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
