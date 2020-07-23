import 'dart:io';

import 'package:flutter/material.dart';
import 'stats_page.dart';
import 'loader.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class CountriesView extends StatefulWidget {
  CountriesView({this.allCountryData});

  final allCountryData;

  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  Widget buildCards(List<Color> color, String country, String countryCode,
      int confirmedCount, String delta) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Loader(
                  allCountryData: widget.allCountryData,
                  countryCode: countryCode,
                  countryName: country,
                );
              },
            ),
          );
        },
        child: Container(
          height: 170.0,
          width: 145.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              colors: color,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.4, 1],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'icons/flags/png/$countryCode.png',
                      height: 15.0,
                      package: 'country_icons',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      country,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  FlutterMoneyFormatter(amount: confirmedCount + 0.0)
                      .output
                      .withoutFractionDigits,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  '[+$delta]',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> CountriesList = [];
  void CountryRows() {
    for (int i = 0; i < 30; i += 2) {
      var row;
      row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildCards(
            [Colors.teal, Colors.blueGrey[600]],
            widget.allCountryData[i]['name'],
            widget.allCountryData[i]['code'].toString().toLowerCase(),
            widget.allCountryData[i]['latest_data']['confirmed'],
            widget.allCountryData[i]['today']['confirmed'].toString(),
          ),
          buildCards(
            [Colors.teal, Colors.blueGrey[600]],
            widget.allCountryData[i + 1]['name'],
            widget.allCountryData[i + 1]['code'].toString().toLowerCase(),
            widget.allCountryData[i + 1]['latest_data']['confirmed'],
            widget.allCountryData[i + 1]['today']['confirmed'].toString(),
          ),
        ],
      );

      CountriesList.add(row);
    }
  }

  @override
  void initState() {
    super.initState();

    CountryRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF4F3),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'Top 30 Countries',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(children: CountriesList),
          ],
        ),
      ),
    );
  }
}
