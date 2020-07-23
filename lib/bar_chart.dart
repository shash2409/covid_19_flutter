import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class BarChartSample3 extends StatefulWidget {
  BarChartSample3({this.xdata, this.ydata});
  final List xdata;
  final List ydata;

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
//  var xdata = new List(7);
//  var ydata = new List(7);
//
//  void setChartData(var covidData) {
//    int length = covidData.length;
//    for (int i = length - 1, j = 0; i >= length - 7; i--, j++) {
//      xdata[j] = covidData[i]['date'].split(" ")[0];
//      ydata[j] = int.parse(covidData[i]['dailyconfirmed']);
//    }
//  }

  @override
  void initState() {
    super.initState();
    //setChartData(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0 / 896.0 * MediaQuery.of(context).size.height,
      width: 320.0 / 414.0 * MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.white,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 50,
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return '${widget.xdata[6]}';
                    case 1:
                      return '${widget.xdata[5]}';
                    case 2:
                      return '${widget.xdata[4]}';
                    case 3:
                      return '${widget.xdata[3]}';
                    case 4:
                      return '${widget.xdata[2]}';
                    case 5:
                      return '${widget.xdata[1]}';
                    case 6:
                      return '${widget.xdata[0]}';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 11),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return '0';
                    case 10:
                      return '10k';
                    case 20:
                      return '20k';
                    case 30:
                      return '30k';
                    case 40:
                      return '40k';
                    case 50:
                      return '50k';
                    default:
                      return '';
                  }
                },
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[6] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[5] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[4] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[3] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[2] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[1] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                      y: widget.ydata[0] / 1000.0, color: Color(0xFFFF9800))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
