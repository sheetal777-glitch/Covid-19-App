import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myths extends StatefulWidget {
  @override
  _MythsState createState() => _MythsState();
}

class _MythsState extends State<Myths> {
  var _data;
  bool _isLoading = true;

  Future<void> getMyths() async {
    String url = "https://nepalcorona.info/api/v1/myths";
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
    getMyths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  elevation: 3,
                  child: Column(
                    children: [
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
