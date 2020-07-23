import 'package:flutter/material.dart';
import 'states_page.dart';

class StatesView extends StatefulWidget {
  StatesView({this.zoneData, this.districtData, this.cData});

  final cData;
  final districtData;
  final zoneData;

  @override
  _StatesViewState createState() => _StatesViewState();
}

class _StatesViewState extends State<StatesView> {
  Widget buildCards(List<Color> color, String state, String confirmed,
      String delta, String stateCode) {
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
          );
        },
        child: Container(
          height: 180.0,
          width: 160.0,
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
                  textAlign: TextAlign.center,
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

  List<Widget> statesList = [];
  void stateRows() {
    for (int i = 1; i < widget.cData['statewise'].length; i += 2) {
      var row;
      if (i == 37) {
        row = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCards(
                [Colors.teal, Colors.teal[100]],
                widget.cData['statewise'][i]['state'],
                widget.cData['statewise'][i]['confirmed'],
                widget.cData['statewise'][i]['deltaconfirmed'],
                widget.cData['statewise'][i]['statecode']),
          ],
        );
      } else {
        row = Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildCards(
                [Colors.teal, Colors.blueGrey[600]],
                widget.cData['statewise'][i]['state'],
                widget.cData['statewise'][i]['confirmed'],
                widget.cData['statewise'][i]['deltaconfirmed'],
                widget.cData['statewise'][i]['statecode']),
            buildCards(
                [Colors.teal, Colors.blueGrey[600]],
                widget.cData['statewise'][i + 1]['state'],
                widget.cData['statewise'][i + 1]['confirmed'],
                widget.cData['statewise'][i + 1]['deltaconfirmed'],
                widget.cData['statewise'][i + 1]['statecode']),
          ],
        );
      }
      statesList.add(row);
    }
  }

  @override
  void initState() {
    super.initState();

    stateRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF4F3),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(children: statesList),
          ],
        ),
      ),
    );
  }
}
