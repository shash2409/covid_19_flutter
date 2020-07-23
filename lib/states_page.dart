import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'constants.dart';
import 'view_all.dart';

class StatePage extends StatefulWidget {
  StatePage(
      {this.cData,
      this.districtData,
      this.stateCode,
      this.state,
      this.stateConfirmed,
      this.zoneData});

  final zoneData;
  final cData;
  final districtData;
  final stateCode;
  final state;
  final stateConfirmed;

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  List Ddata;
  List<DataRow> tableRows;
  bool sort = true;
  int colIndex = 1;

  @override
  void initState() {
    super.initState();
    getDdata(widget.districtData);
    getDataRows(Ddata, widget.zoneData);
  }

  void onColumnSort(index, sort) {
    String s = '';
    if (index == 1) {
      s = 'confirmed';
    } else if (index == 3) {
      s = 'recovered';
    } else if (index == 4) {
      s = 'deceased';
    }

    //sort
    if (!sort) {
      Ddata.sort((a, b) => a[s].compareTo(b[s]));
    } else {
      Ddata.sort((b, a) => a[s].compareTo(b[s]));
    }
  }

  void getDdata(List data) {
    var dData = data
        .where((element) => element['statecode'] == widget.stateCode)
        .toList();
    Ddata = dData[0]['districtData'];
    Ddata.sort((b, a) => a['confirmed'].compareTo(b['confirmed']));
  }

  void getDataRows(List data, List zoneData) {
    tableRows = [];
    List zData = [];

    for (int i = 0; i < data.length; i++) {
      if (data[i]['district'] == 'Unknown' ||
          data[i]['district'] == 'Other State' ||
          data[i]['district'] == 'Airport Quarantine' ||
          data[i]['district'] == 'Railway Quarantine' ||
          data[i]['district'] == 'Evacuees' ||
          data[i]['district'] == 'BSF Camp' ||
          data[i]['district'] == 'Italians' ||
          data[i]['district'] == 'Other Region' ||
          data[i]['district'] == 'Mirpur' ||
          data[i]['district'] == 'Muzaffarabad' ||
          data[i]['district'] == 'Unassigned' ||
          data[i]['district'] == 'Dadra and Nagar Haveli and Daman and Diu') {
        continue;
      }
      var z = zoneData
          .where((element) => element['district'] == data[i]['district']);
      zData.add(z);
    }

//    for (int i = 0; i < zData.length; i++) {
//      print(zData[i].last['zone']);
//    }

    for (int i = 0, j = 0; i < data.length; i++) {
      Color color;

      if (data[i]['district'] == 'Unknown' ||
          data[i]['district'] == 'Other State' ||
          data[i]['district'] == 'Airport Quarantine' ||
          data[i]['district'] == 'Railway Quarantine' ||
          data[i]['district'] == 'Evacuees' ||
          data[i]['district'] == 'BSF Camp' ||
          data[i]['district'] == 'Italians' ||
          data[i]['district'] == 'Other Region' ||
          data[i]['district'] == 'Mirpur' ||
          data[i]['district'] == 'Muzaffarabad' ||
          data[i]['district'] == 'Unassigned' ||
          data[i]['district'] == 'Dadra and Nagar Haveli and Daman and Diu') {
        color = Colors.grey;
      } else {
        //assign zonal color
        if (zData[j].last['zone'] == 'Red') {
          color = Colors.red;
        } else if (zData[j].last['zone'] == 'Orange') {
          color = Colors.orange;
        } else if (zData[j].last['zone'] == 'Green') {
          color = Colors.teal[400];
        }
        j++;
      }

      //create row
      var newRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            data[i]['district'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 17.0,
            ),
          )),
          DataCell(
            Row(
              children: <Widget>[
                Text(
                  '+' + data[i]['delta']['confirmed'].toString(),
                  style: deltaConfirmed,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  data[i]['confirmed'].toString(),
                  style: numberStyle,
                ),
              ],
            ),
          ),
          DataCell(Row(children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Text(
              data[i]['active'].toString(),
              style: numberStyle,
            ),
          ])),
          DataCell(Row(
            children: <Widget>[
              Text(
                '+' + data[i]['delta']['recovered'].toString(),
                style: deltaRecovered,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                data[i]['recovered'].toString(),
                style: numberStyle,
              ),
            ],
          )),
          DataCell(Row(
            children: <Widget>[
              Text(
                '+' + data[i]['delta']['deceased'].toString(),
                style: deltaDeceased,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                data[i]['deceased'].toString(),
                style: numberStyle,
              ),
            ],
          )),
        ],
      );
      tableRows.add(newRow);
    }
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
                            Text(
                              widget.state,
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
                                      int.parse(widget.stateConfirmed) + 0.0)
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
              height: screenHeight - 230,
              width: screenWidth,
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
                    Container(
                      height: 275.0 / 896.0 * screenHeight,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 0.5,
                      ))),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: DataTable(
                              sortColumnIndex: colIndex,
                              sortAscending: sort,
                              columnSpacing: 25,
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'District',
                                    style: columnHeadingStyle,
                                  ),
                                  numeric: false,
                                ),
                                DataColumn(
                                  onSort: (i, b) {
                                    setState(() {
                                      sort = !sort;
                                      colIndex = 1;
                                    });
                                    onColumnSort(1, sort);
                                    getDataRows(Ddata, widget.zoneData);
                                  },
                                  label: Text(
                                    'Confirmed',
                                    style: columnHeadingStyle,
                                  ),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text(
                                    'Active',
                                    style: columnHeadingStyle,
                                  ),
                                  numeric: true,
                                ),
                                DataColumn(
                                  onSort: (i, b) {
                                    setState(() {
                                      sort = !sort;
                                      colIndex = 3;
                                    });
                                    onColumnSort(3, sort);
                                    getDataRows(Ddata, widget.zoneData);
                                  },
                                  label: Text(
                                    'Recovered',
                                    style: columnHeadingStyle,
                                  ),
                                  numeric: true,
                                ),
                                DataColumn(
                                  onSort: (i, b) {
                                    setState(() {
                                      sort = !sort;
                                      colIndex = 4;
                                    });
                                    onColumnSort(4, sort);
                                    getDataRows(Ddata, widget.zoneData);
                                  },
                                  label: Text(
                                    'Deceased',
                                    style: columnHeadingStyle,
                                  ),
                                  numeric: true,
                                ),
                              ],
                              rows: tableRows,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0),
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
          )
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
        onTap: () => Navigator.pushReplacement(
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
}
