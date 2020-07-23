import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'page_1.dart';
import 'page2_alt.dart';
import 'page_3.dart';
import 'loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    @required this.worldData,
    @required this.allCountryData,
    @required this.indiaData,
    this.districtData,
    this.zoneData,
  }) : super(key: key);

  final worldData;
  final allCountryData;
  final districtData;
  final zoneData;
  final indiaData;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  int affected;
  String affectedCases;
  int active;
  String activeCases;
  int dead;
  String deadCases;
  int recovered;
  String recoveredCases;

  //Top countries data
  int chinaConfirmed;
  int chinaDelta;
  int italyConfirmed;
  int italyDelta;
  int usaConfirmed;
  int usaDelta;
  int ukConfirmed;
  int ukDelta;
  int spainConfirmed;
  int spainDelta;

  double activePercent;
  double deadPercent;
  double recoveredPercent;

  void updateGlobalData(var worldData) {
    setState(() {
      affected = worldData['data'][0]['confirmed'];
      dead = worldData['data'][0]['deaths'];
      recovered = worldData['data'][0]['recovered'];
      active = worldData['data'][0]['active'];
    });
    convertString();
  }

  int confirmedCasesIN;
  int activeCasesIN;
  int recoveredCasesIN;
  int deceasedCasesIN;
  int deltaConfirmedIN;
  int deltaRecoveredIN;
  int deltaDeceasedIN;
  String updateTimeIN;
  void updateIndiaData(var indiaData) {
    confirmedCasesIN = int.parse(indiaData['statewise'][0]['confirmed']);
    activeCasesIN = int.parse(indiaData['statewise'][0]['active']);
    recoveredCasesIN = int.parse(indiaData['statewise'][0]['recovered']);
    deceasedCasesIN = int.parse(indiaData['statewise'][0]['deaths']);
    deltaConfirmedIN = int.parse(indiaData['statewise'][0]['deltaconfirmed']);
    deltaDeceasedIN = int.parse(indiaData['statewise'][0]['deltadeaths']);
    deltaRecoveredIN = int.parse(indiaData['statewise'][0]['deltarecovered']);
    updateTimeIN = indiaData['statewise'][0]['lastupdatedtime'];
  }

  var xdata = new List(7);
  var ydata = new List(7);
  void updateChartData(var data) {
    int length = data.length;
    for (int i = length - 1, j = 0; i >= length - 7; i--, j++) {
      xdata[j] = data[i]['date'].split(" ")[0];
      ydata[j] = int.parse(data[i]['dailyconfirmed']);
    }
  }

  void convertString() {
    if (affected >= 1000000) {
      affectedCases =
          ((affected / 1000000.0).toStringAsFixed(1)).toString() + 'M';
    }
    if (active >= 1000000) {
      activeCases = ((active / 1000000.0).toStringAsFixed(1)).toString() + 'M';
    }
    if (dead >= 1000000) {
      deadCases = ((dead / 1000000.0).toStringAsFixed(1)).toString() + 'M';
    } else if (dead > 1000) {
      deadCases = ((dead / 1000.0).toStringAsFixed(1)).toString() + 'k';
    }
    if (recovered >= 1000000) {
      recoveredCases =
          ((recovered / 1000000.0).toStringAsFixed(1)).toString() + 'M';
    }
    activePercent = active / affected;
    deadPercent = dead / affected;
    recoveredPercent = recovered / affected;
  }

  PageController controller = PageController();
  List<GButton> tabs = new List();

  //init state
  @override
  void initState() {
    super.initState();
    updateGlobalData(widget.worldData);
    updateIndiaData(widget.indiaData);
    updateChartData(widget.indiaData['cases_time_series']);

    var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
    double gap = 10;
    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.blueGrey[300],
      textColor: Colors.teal,
      backgroundColor: Color(0xFFD3E8E5),
      iconSize: 22,
      padding: padding,
      icon: Icons.public,
      text: 'Global',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.blueGrey[300],
      textColor: Colors.teal,
      backgroundColor: Color(0xFFD3E8E5),
      iconSize: 22,
      padding: padding,
      icon: Icons.flag,
      text: 'India',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.blueGrey[300],
      textColor: Colors.teal,
      backgroundColor: Color(0xFFD3E8E5),
      iconSize: 22,
      padding: padding,
      icon: Icons.lightbulb_outline,
      text: 'Prevent',
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: AlwaysScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
        controller: controller,
        children: <Widget>[
          Dashboard(
            onCardPressed: () => controller.jumpToPage(2),
            allCountryData: widget.allCountryData,
            activeCases: activeCases,
            affectedCases: affectedCases,
            deadCases: deadCases,
            recoveredCases: recoveredCases,
            activePercent: activePercent,
            deadPercent: deadPercent,
            recoveredPercent: recoveredPercent,
          ),
          IndiaSpecific(
            cData: widget.indiaData,
            districtData: widget.districtData,
            zoneData: widget.zoneData,
            confirmedCases: confirmedCasesIN,
            deceasedCases: deceasedCasesIN,
            deltaConfirmed: deltaConfirmedIN,
            deltaDeceased: deltaDeceasedIN,
            deltaRecovered: deltaRecoveredIN,
            recoveredCases: recoveredCasesIN,
            activeCases: activeCasesIN,
            updateTime: updateTimeIN,
            xdata: xdata,
            ydata: ydata,
          ),
          Stats(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            bottom: 0.0282 * (MediaQuery.of(context).size.height),
            top: 0.024 * (MediaQuery.of(context).size.height)),
        decoration: BoxDecoration(
          color: Color(0xFFECF4F3),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          boxShadow: [
            BoxShadow(
                spreadRadius: 0.1,
                blurRadius: 6,
                color: Colors.black.withOpacity(.15),
                offset: Offset(0, -0.1))
          ],
        ),
        child: GNav(
          tabs: tabs,
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
            controller.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
