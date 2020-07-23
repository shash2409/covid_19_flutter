import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'covid_data.dart';
import 'stats_page.dart';

class Loader extends StatefulWidget {
  Loader({
    this.allCountryData,
    this.countryCode,
    this.countryName,
  });

  final allCountryData;
  final countryCode;
  final countryName;

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  var xdata = new List(30);
  var ydata = new List(30);

  void getCountryStats() async {
    var countryData = await CovidModel().getCountryData(widget.countryCode);
    updateChartData(countryData);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return StatPage(
            countryData: countryData,
            xdata: xdata,
            ydata: ydata,
            allCountryData: widget.allCountryData,
            countryName: widget.countryName,
            countryCode: widget.countryCode,
          );
        },
      ),
    );
  }

  void updateChartData(var data) {
    for (int i = 0; i < 30; i++) {
      xdata[i] =
          data[i]['date'].split("-")[2] + '/' + data[i]['date'].split("-")[1];
      ydata[i] = data[i]['new_confirmed'] + 0.0;
    }
  }

  @override
  void initState() {
    super.initState();
    getCountryStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
