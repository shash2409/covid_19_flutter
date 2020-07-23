import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: 160.0 / 896.0 * MediaQuery.of(context).size.height,
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
                    padding: EdgeInsets.only(left: 20.0),
                    child: Image.asset(
                      'assets/illustrations/hand-wash.png',
                      height:
                          120.0 / 896.0 * MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WASH',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          'HANDS',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0),
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: 160.0 / 896.0 * MediaQuery.of(context).size.height,
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
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/illustrations/laptop.png'),
                        height:
                            130.0 / 896.0 * MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SOCIAL',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'DISTANCING',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0),
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: 160.0 / 896 * MediaQuery.of(context).size.height,
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
                    padding: EdgeInsets.only(left: 20.0),
                    child: Image.asset(
                      'assets/illustrations/780.png',
                      height:
                          120.0 / 896.0 * MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'COVER YOUR',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          'COUGH',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 00),
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: 160.0 / 896.0 * MediaQuery.of(context).size.height,
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
                      padding: EdgeInsets.only(left: 20.0),
                      child: Image(
                        image:
                            AssetImage('assets/illustrations/gummy-mask.png'),
                        height:
                            150 / 896.0 * MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEAR A',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          'MASK',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
