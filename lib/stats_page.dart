import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';
import 'line_chart.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'loader.dart';
import 'view_more.dart';

class StatPage extends StatefulWidget {
  StatPage({
    this.countryData,
    this.allCountryData,
    this.ydata,
    this.xdata,
    this.countryCode,
    this.countryName,
  });

  final allCountryData;
  final countryData;
  final xdata;
  final ydata;
  final countryCode;
  final countryName;

  @override
  _StatPageState createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  String dropdownValue;
  @override
  void initState() {
    super.initState();
    setState(() {
      dropdownValue = '7 Days';
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: <Widget>[
          Container(
            height: 230.0 / 896.0 * screenHeight,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 40.0 / 896.0 * screenHeight,
                    bottom: 10 / 896.0 * screenHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        color: Colors.teal,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: 45.0,
                            height: 45.0 / 896.0 * screenHeight,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white60,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white70,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'icons/flags/png/${widget.countryCode}.png',
                              height: 18.0,
                              package: 'country_icons',
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              widget.countryName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          FlutterMoneyFormatter(
                                  amount:
                                      widget.countryData[0]['confirmed'] + 0.0)
                              .output
                              .withoutFractionDigits,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 45.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height - 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 35.0 / 896.0 * screenHeight, left: 0.0, right: 0.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'New Cases',
                            style: TextStyle(
                              color: Colors.teal[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Container(
                            height: 35.0 / 896.0 * screenHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFFECF4F3).withOpacity(0.9),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  isDense: true,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 18,
                                  elevation: 10,
                                  style: TextStyle(
                                      color: Colors.teal[600],
                                      fontWeight: FontWeight.w600),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>['7 Days', '21 Days']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0 / 896.0 * screenHeight,
                    ),
                    LineChartCountry(
                      xdata: widget.xdata,
                      ydata: widget.ydata,
                      dValue: dropdownValue,
                    ),
                    SizedBox(
                      height: 30.0 / 896.0 * screenHeight,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 35.0,
                          right: 35.0,
                          top: 20.0 / 896.0 * screenHeight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Top Countries',
                            style: TextStyle(
                                color: Colors.teal[900],
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CountriesView(
                                    allCountryData: widget.allCountryData,
                                  );
                                },
                              ),
                            ),
                            child: Text(
                              'View More',
                              style: TextStyle(
                                color: Colors.teal[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        top: 10.0 / 896.0 * screenHeight,
                      ),
                      child: Container(
                        height: 220.0 / 896.0 * screenHeight,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            buildBottomCards(
                              [Colors.teal, Colors.teal[100]],
                              widget.allCountryData[0]['name'],
                              widget.allCountryData[0]['code']
                                  .toString()
                                  .toLowerCase(),
                              widget.allCountryData[0]['latest_data']
                                  ['confirmed'],
                              widget.allCountryData[0]['today']['confirmed']
                                  .toString(),
                            ),
                            buildBottomCards(
                              [Colors.orange, Colors.orange[100]],
                              widget.allCountryData[1]['name'],
                              widget.allCountryData[1]['code']
                                  .toString()
                                  .toLowerCase(),
                              widget.allCountryData[1]['latest_data']
                                  ['confirmed'],
                              widget.allCountryData[1]['today']['confirmed']
                                  .toString(),
                            ),
                            buildBottomCards(
                              [Colors.red, Colors.red[100]],
                              widget.allCountryData[2]['name'],
                              widget.allCountryData[2]['code']
                                  .toString()
                                  .toLowerCase(),
                              widget.allCountryData[2]['latest_data']
                                  ['confirmed'],
                              widget.allCountryData[2]['today']['confirmed']
                                  .toString(),
                            ),
                            buildBottomCards(
                              [Colors.blue, Colors.blue[100]],
                              widget.allCountryData[3]['name'],
                              widget.allCountryData[3]['code']
                                  .toString()
                                  .toLowerCase(),
                              widget.allCountryData[3]['latest_data']
                                  ['confirmed'],
                              widget.allCountryData[3]['today']['confirmed']
                                  .toString(),
                            ),
                            buildBottomCards(
                              [Colors.purple, Colors.purple[100]],
                              widget.allCountryData[4]['name'],
                              widget.allCountryData[4]['code']
                                  .toString()
                                  .toLowerCase(),
                              widget.allCountryData[4]['latest_data']
                                  ['confirmed'],
                              widget.allCountryData[4]['today']['confirmed']
                                  .toString(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBottomCards(List<Color> color, String country, String countryCode,
      int confirmedCount, String delta) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0 / 896.0 * MediaQuery.of(context).size.height,
        bottom: 10.0 / 896.0 * MediaQuery.of(context).size.height,
        left: 10.0,
        right: 10.0,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Loader(
                countryCode: countryCode,
                countryName: country,
                allCountryData: widget.allCountryData,
              );
            },
          ),
        ),
        child: Container(
          height: 120.0 / 896.0 * MediaQuery.of(context).size.height,
          width: 150.0 / 414.0 * MediaQuery.of(context).size.width,
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
              top: 30.0 / 896.0 * MediaQuery.of(context).size.height,
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
                  height: 10.0 / 896.0 * MediaQuery.of(context).size.height,
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
                  height: 2.0 / 896.0 * MediaQuery.of(context).size.height,
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
}
