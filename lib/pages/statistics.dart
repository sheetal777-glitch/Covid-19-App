import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:corona_tracking/models/bottom_cards.dart';
import 'package:corona_tracking/models/corona_model.dart';
import 'package:corona_tracking/models/top_cards.dart';
import 'package:corona_tracking/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  var myData;
  bool isLoading = true;

  Future<void> getLatestUpdate() async {
    try {
      String url = "https://nepalcorona.info/api/v1/data/nepal";
      var response = await http.get(url);
      myData = json.decode(response.body);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  // ********** FOR GRAPH ********** //
  List data;
  List<CoronaData> coronadata = [];
  Future corona() async {
    String url = "https://data.nepalcorona.info/api/v1/covid/timeline";
    var response = await http.get(url);
    setState(() {
      data = json.decode(response.body);
    });
  }

  Widget chartWidget() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top - //status bar
        kToolbarHeight; //appbar
    if (data != null) {
      for (Map m in data) {
        coronadata.add(new CoronaData(
            DateTime.parse(m["date"]),
            m["totalCases"],
            m["newCases"],
            m["totalRecoveries"],
            m["newRecoveries"],
            m["totalDeaths"],
            m["newDeaths"]));
      }
    } else {
      coronadata.add(new CoronaData(DateTime.now(), 0, 0, 0, 0, 0, 0));
    }
    var series = [
      new charts.Series<CoronaData, DateTime>(
        id: "new cases",
        data: coronadata,
        domainFn: (CoronaData data1, _) => data1.date,
        measureFn: (CoronaData data1, _) => data1.newCases,
      ),
    ];
    var chart = new charts.TimeSeriesChart(
      series,
      animate: true,
    );
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            'Daily New Cases',
            style: GoogleFonts.merriweather(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new SizedBox(
              height: height * 0.3,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLatestUpdate();
    corona();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top - //status bar
        kToolbarHeight - //appbar
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: SingleChildScrollView(
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                //main column
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TopCards(
                            titleText: "Total Tested",
                            detailsText: myData['tested_total'].toString(),
                            color: amberAccent,
                          ),
                        ),
                        Expanded(
                          child: TopCards(
                            titleText: "Tested Positive",
                            detailsText: myData['tested_positive'].toString(),
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, top: 8, right: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: BottomCards(
                            titleText: "Deaths",
                            detailsText: myData['deaths'].toString(),
                            color: redAccent,
                          ),
                        ),
                        Expanded(
                          child: BottomCards(
                              titleText: "Recovered",
                              detailsText: myData['recovered'].toString(),
                              color: lightGreen),
                        ),
                        Expanded(
                          child: BottomCards(
                              titleText: "Quarantined",
                              detailsText: myData['quarantined'].toString(),
                              color: deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Text(
                          'Source : https://nepalcorona.com/data/api',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: height * 0.05,
                  ),

                  //Graph of daily new cases
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    height: height * 0.45,
                    child: chartWidget(),
                  ),
                ],
              ),
      ),
    );
  }
}
