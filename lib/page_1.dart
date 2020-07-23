import 'package:covid19/loader.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'stats_page.dart';
import 'view_more.dart';

class Dashboard extends StatefulWidget {
  Dashboard({
    this.activeCases,
    this.affectedCases,
    this.deadCases,
    this.recoveredCases,
    this.activePercent,
    this.deadPercent,
    this.recoveredPercent,
    this.allCountryData,
    this.onCardPressed,
  });

  final allCountryData;

  final VoidCallback onCardPressed;

  //worldwide
  final activeCases;
  final affectedCases;
  final deadCases;
  final recoveredCases;
  final activePercent;
  final deadPercent;
  final recoveredPercent;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedButton = 0;
  double percent;

  void setPercent() {
    if (selectedButton == 2) {
      percent = widget.recoveredPercent;
    } else if (selectedButton == 1) {
      percent = widget.deadPercent;
    } else {
      percent = widget.activePercent;
    }
  }

  List<String> title = ['Active', 'Dead', 'Recovered'];
  Widget buildBottomCards(List<Color> color, String country, String countryCode,
      int confirmedCount, String delta) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
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
        ),
        child: Container(
          height: 110.0,
          width: 150.0,
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

  Widget buildTopCards(List<Color> colors, String title, Color iconColor,
      Color textColor, Color countColor) {
    String count;
    if (title == 'Affected') {
      count = widget.affectedCases;
    } else if (selectedButton == 0) {
      count = widget.activeCases;
    } else if (selectedButton == 1) {
      count = widget.deadCases;
    } else if (selectedButton == 2) {
      count = widget.recoveredCases;
    }
    return Container(
      height: 68.0,
      width: 130.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: [0.35, 1],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontFamily: 'Montserrat',
                      color: textColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_up,
                    color: iconColor,
                    size: 15.0,
                  )
                ],
              ),
              Text(
                count,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: countColor,
                ),
              )
            ],
          ),
          Icon(
            Icons.show_chart,
            color: iconColor,
          ),
          SizedBox(
            width: 2.0,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setPercent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 12.0 / 414.0 * MediaQuery.of(context).size.width,
                  right: 12.0 / 414.0 * MediaQuery.of(context).size.width,
                  top: 20),
              child: GestureDetector(
                onTap: widget.onCardPressed,
                child: Container(
                  margin: EdgeInsets.only(
                      left: 20 / 414.0 * MediaQuery.of(context).size.width,
                      right: 20 / 414.0 * MediaQuery.of(context).size.width,
                      top: 20,
                      bottom: 20),
                  width: 250.0 / 414.0 * MediaQuery.of(context).size.width,
                  height: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFECF4F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.3, 0.8),
                          blurRadius: 2.5,
                          spreadRadius: 2.0,
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.0 /
                                414.0 *
                                MediaQuery.of(context).size.width),
                        child: Image.asset(
                          'assets/illustrations/780.png',
                          height: 110.0,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.0 /
                                414.0 *
                                MediaQuery.of(context).size.width,
                            right: 10.0 /
                                414.0 *
                                MediaQuery.of(context).size.width),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '5 Tips to Prevent',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                fontFamily: 'Montserrat',
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'COVID-19',
                              style: TextStyle(
                                color: Colors.teal[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Read more',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontFamily: 'Montserrat',
                                    color: Colors.teal[600],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.teal[600],
                                  size: 17.0,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      child: CircularPercentIndicator(
                        radius: 150.0,
                        lineWidth: 35.0,
                        percent: 0,
                        backgroundColor: Color(0xFFEBF3F2),
                      ),
                    ),
                    Positioned(
                      top: 15.0,
                      child: CircularPercentIndicator(
                        radius: 150.0,
                        lineWidth: 4.0,
                        percent: percent,
                        animation: true,
                        animationDuration: 800,
                        backgroundColor: Color(0xFFEDF5F4),
                        progressColor: Colors.teal[500],
                        circularStrokeCap: CircularStrokeCap.butt,
                        center: Text(
                          '${(percent * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[600],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: <Widget>[
                    buildTopCards(
                      [Color(0xFFF7EAE9), Colors.white],
                      'Affected',
                      Colors.red[600],
                      Colors.red[900],
                      Color(0xFF4f0a12),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    buildTopCards(
                      [Color(0xFFECF4F3), Colors.white],
                      title[selectedButton],
                      Colors.teal[600],
                      Colors.teal[900],
                      Colors.teal[900],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    textColor: selectedButton == 0
                        ? Colors.teal[800]
                        : Colors.teal[800].withOpacity(0.5),
                    color: selectedButton == 0 ? Color(0xFFEBF3F2) : null,
                    onPressed: () {
                      setState(() {
                        selectedButton = 0;
                        setPercent();
                      });
                    },
                    child: Text(
                      'Active Cases',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FlatButton(
                    textColor: selectedButton == 1
                        ? Colors.teal[800]
                        : Colors.teal[800].withOpacity(0.5),
                    color: selectedButton == 1 ? Color(0xFFEBF3F2) : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                        setPercent();
                      });
                    },
                    child: Text('Dead'),
                  ),
                  FlatButton(
                    textColor: selectedButton == 2
                        ? Colors.teal[800]
                        : Colors.teal[800].withOpacity(0.5),
                    color: selectedButton == 2 ? Color(0xFFEBF3F2) : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 2;
                        setPercent();
                      });
                    },
                    child: Text('Recovered'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
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
                    onTap: () => Navigator.push(
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
                top: 10.0,
              ),
              child: Container(
                height: 220.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildBottomCards(
                      [Colors.teal, Colors.teal[100]],
                      widget.allCountryData[0]['name'],
                      widget.allCountryData[0]['code'].toString().toLowerCase(),
                      widget.allCountryData[0]['latest_data']['confirmed'],
                      widget.allCountryData[0]['today']['confirmed'].toString(),
                    ),
                    buildBottomCards(
                      [Colors.orange, Colors.orange[100]],
                      widget.allCountryData[1]['name'],
                      widget.allCountryData[1]['code'].toString().toLowerCase(),
                      widget.allCountryData[1]['latest_data']['confirmed'],
                      widget.allCountryData[1]['today']['confirmed'].toString(),
                    ),
                    buildBottomCards(
                      [Colors.red, Colors.red[100]],
                      widget.allCountryData[2]['name'],
                      widget.allCountryData[2]['code'].toString().toLowerCase(),
                      widget.allCountryData[2]['latest_data']['confirmed'],
                      widget.allCountryData[2]['today']['confirmed'].toString(),
                    ),
                    buildBottomCards(
                      [Colors.blue, Colors.blue[100]],
                      widget.allCountryData[3]['name'],
                      widget.allCountryData[3]['code'].toString().toLowerCase(),
                      widget.allCountryData[3]['latest_data']['confirmed'],
                      widget.allCountryData[3]['today']['confirmed'].toString(),
                    ),
                    buildBottomCards(
                      [Colors.purple, Colors.purple[100]],
                      widget.allCountryData[4]['name'],
                      widget.allCountryData[4]['code'].toString().toLowerCase(),
                      widget.allCountryData[4]['latest_data']['confirmed'],
                      widget.allCountryData[4]['today']['confirmed'].toString(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
