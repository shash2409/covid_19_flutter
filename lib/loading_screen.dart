import 'package:covid19/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'covid_data.dart';
import 'main.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getVirusData() async {
    var globalData = await CovidModel().getGlobalData();
    var desiData = await CovidModel().getIndiaData();

    List allCountryData = await CovidModel().getAllCountriesData();
    allCountryData.sort((b, a) =>
        a['latest_data']['confirmed'].compareTo(b['latest_data']['confirmed']));

    //district wise
    var districtData = await CovidModel().getDistrictData();
    var zoneData = await CovidModel().getZoneData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MyHomePage(
            worldData: globalData,
            allCountryData: allCountryData,
            indiaData: desiData,
            districtData: districtData,
            zoneData: zoneData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getVirusData();
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
