import 'dart:convert';
import 'package:flutter/material.dart';
import 'bar_chart.dart';
import 'package:country_icons/country_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'states_page.dart';
import 'view_all.dart';

class IndiaSpecific extends StatefulWidget {
  IndiaSpecific(
      {this.cData,
      this.districtData,
      this.zoneData,
      this.confirmedCases,
      this.activeCases,
      this.recoveredCases,
      this.updateTime,
      this.deltaConfirmed,
      this.deltaRecovered,
      this.deceasedCases,
      this.deltaDeceased,
      this.xdata,
      this.ydata});

  final districtData;
  final zoneData;
  final cData;
  final List xdata;
  final List ydata;
  final int confirmedCases;
  final int activeCases;
  final int recoveredCases;
  final int deceasedCases;
  final int deltaConfirmed;
  final int deltaRecovered;
  final int deltaDeceased;
  final String updateTime;

  @override
  _IndiaSpecificState createState() => _IndiaSpecificState();
}

class _IndiaSpecificState extends State<IndiaSpecific> {
  double collapsedHeightFactor = 0.68;
  double expandedHeightFactor = 0.35;
  double screenHeight = 0;

  //covid data

  @override
  void initState() {
    super.initState();
    //setCovidData(widget.cData);
  }

  Widget getWidget() {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.65,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SafeArea(
                    bottom: false,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height:
                            160.0 / 896 * MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'COVID-19',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 10.0,
                                      bottom: 10.0 /
                                          896.0 *
                                          MediaQuery.of(context).size.height),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'icons/flags/png/in.png',
                                        height: 15.0,
                                        package: 'country_icons',
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        ' INDIA',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 0.0,
                        bottom: 20.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                child: Text(
                                  'Statistics',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    bottom: 10.0 /
                                        896.0 *
                                        MediaQuery.of(context).size.height),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 20.0, left: 20.0),
                                child: Text(
                                  'Last Updated: ${widget.updateTime}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 97.0 /
                                    896.0 *
                                    MediaQuery.of(context).size.height,
                                width: 150.0 /
                                    414.0 *
                                    MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        offset: Offset(
                                          2.0,
                                          8.0,
                                        ),
                                        color: Colors.black12,
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        bottom: 5.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        'Confirmed',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.red.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        bottom: 0.0,
                                      ),
                                      child: Text(
                                        '+[${widget.deltaConfirmed.toString()}]',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.red.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        top: 10.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                        bottom: 5.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        FlutterMoneyFormatter(
                                                amount:
                                                    widget.confirmedCases + 0.0)
                                            .output
                                            .withoutFractionDigits,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21.0,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 97.0 /
                                    896.0 *
                                    MediaQuery.of(context).size.height,
                                width: 150.0 /
                                    414.0 *
                                    MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        offset: Offset(
                                          2.0,
                                          8.0,
                                        ),
                                        color: Colors.black12,
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 15.0,
                                        bottom: 15.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        'Active',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        top: 15.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                        bottom: 5.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        FlutterMoneyFormatter(
                                                amount:
                                                    widget.activeCases + 0.0)
                                            .output
                                            .withoutFractionDigits,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21.0,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0 /
                                896.0 *
                                MediaQuery.of(context).size.height,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 97.0 /
                                    896.0 *
                                    MediaQuery.of(context).size.height,
                                width: 150.0 /
                                    414.0 *
                                    MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        offset: Offset(
                                          2.0,
                                          8.0,
                                        ),
                                        color: Colors.black12,
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        bottom: 5.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        'Recovered',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.teal.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        bottom: 0.0,
                                      ),
                                      child: Text(
                                        '+[${widget.deltaRecovered.toString()}]',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.teal.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        top: 10.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                        bottom: 5.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        FlutterMoneyFormatter(
                                                amount:
                                                    widget.recoveredCases + 0.0)
                                            .output
                                            .withoutFractionDigits,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21.0,
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 97.0 /
                                    896.0 *
                                    MediaQuery.of(context).size.height,
                                width: 150.0 /
                                    414.0 *
                                    MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        offset: Offset(
                                          2.0,
                                          8.0,
                                        ),
                                        color: Colors.black12,
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        bottom: 5.0,
                                      ),
                                      child: Text(
                                        'Deceased',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        bottom: 0.0,
                                      ),
                                      child: Text(
                                        '+[${widget.deltaDeceased.toString()}]',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.0,
                                        top: 10.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                        bottom: 5.0 /
                                            896.0 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      child: Text(
                                        FlutterMoneyFormatter(
                                                amount:
                                                    widget.deceasedCases + 0.0)
                                            .output
                                            .withoutFractionDigits,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            borderRadius: BorderRadius.circular(40.0),
            minHeight: 370.0 / 896.0 * MediaQuery.of(context).size.height,
            maxHeight: 660.0 / 414.0 * MediaQuery.of(context).size.width,
            panel: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.2, -1),
                    color: Colors.black12,
                    blurRadius: 3.0,
                    spreadRadius: 2.0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                physics:
                    NeverScrollableScrollPhysics(), //to fix RenderFlex Overflow
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 9.0 / 896.0 * MediaQuery.of(context).size.height,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 6.0,
                        width:
                            100.0 / 896.0 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70.0),
                          color: Colors.black26.withOpacity(0.15),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 40.0,
                              top: 15.0 /
                                  896.0 *
                                  MediaQuery.of(context).size.height),
                          child: Text(
                            'Daily Cases',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25, top: 20.0, bottom: 5.0),
                      child: BarChartSample3(
                        xdata: widget.xdata,
                        ydata: widget.ydata,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 35.0, right: 35.0, top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Top States',
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
                                  return StatesView(
                                    cData: widget.cData,
                                    zoneData: widget.zoneData,
                                    districtData: widget.districtData,
                                  );
                                },
                              ),
                            ),
                            child: Text(
                              'View All',
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
                        left: 15.0,
                        top: 10.0,
                      ),
                      child: Container(
                        height:
                            220.0 / 896.0 * MediaQuery.of(context).size.height,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            buildBottomCards(
                                [Color(0xFFFF9800), Colors.orange[100]],
                                widget.cData['statewise'][1]['state'],
                                widget.cData['statewise'][1]['confirmed'],
                                widget.cData['statewise'][1]['deltaconfirmed'],
                                widget.cData['statewise'][1]['statecode']),
                            buildBottomCards(
                                [Colors.teal, Colors.teal[100]],
                                widget.cData['statewise'][2]['state'],
                                widget.cData['statewise'][2]['confirmed'],
                                widget.cData['statewise'][2]['deltaconfirmed'],
                                widget.cData['statewise'][2]['statecode']),
                            buildBottomCards(
                                [Colors.blue, Colors.blue[200]],
                                widget.cData['statewise'][3]['state'],
                                widget.cData['statewise'][3]['confirmed'],
                                widget.cData['statewise'][3]['deltaconfirmed'],
                                widget.cData['statewise'][3]['statecode']),
                            buildBottomCards(
                                [Colors.red, Colors.red[100]],
                                widget.cData['statewise'][4]['state'],
                                widget.cData['statewise'][4]['confirmed'],
                                widget.cData['statewise'][4]['deltaconfirmed'],
                                widget.cData['statewise'][4]['statecode']),
                            buildBottomCards(
                                [Colors.purple, Colors.purple[100]],
                                widget.cData['statewise'][5]['state'],
                                widget.cData['statewise'][5]['confirmed'],
                                widget.cData['statewise'][5]['deltaconfirmed'],
                                widget.cData['statewise'][5]['statecode']),
                            buildBottomCards(
                                [Colors.blueGrey, Colors.blueGrey[100]],
                                widget.cData['statewise'][6]['state'],
                                widget.cData['statewise'][6]['confirmed'],
                                widget.cData['statewise'][6]['deltaconfirmed'],
                                widget.cData['statewise'][6]['statecode'])
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomCards(List<Color> color, String state, String confirmed,
      String delta, String stateCode) {
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
              return StatePage(
                cData: widget.cData,
                districtData: widget.districtData,
                zoneData: widget.zoneData,
                stateCode: stateCode,
                state: state,
                stateConfirmed: confirmed,
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
              stops: [0.45, 1],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  state,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  confirmed,
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
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//  void setCovidData(var covidData) {
//    setState(() {
//      confirmedCases = int.parse(covidData['statewise'][0]['confirmed']);
//      activeCases = int.parse(covidData['statewise'][0]['active']);
//      recoveredCases = int.parse(covidData['statewise'][0]['recovered']);
//      deceasedCases = int.parse(covidData['statewise'][0]['deaths']);
//      deltaConfirmed = int.parse(covidData['statewise'][0]['deltaconfirmed']);
//      deltaDeceased = int.parse(covidData['statewise'][0]['deltadeaths']);
//      deltaRecovered = int.parse(covidData['statewise'][0]['deltarecovered']);
//      updateTime = covidData['statewise'][0]['lastupdatedtime'];
//    });
//  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return getWidget();
  }
}
