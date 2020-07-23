import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCountry extends StatefulWidget {
  LineChartCountry({@required this.xdata, @required this.ydata, this.dValue});
  final xdata;
  final ydata;
  final dValue;

  @override
  _LineChartCountryState createState() => _LineChartCountryState();
}

class _LineChartCountryState extends State<LineChartCountry> {
  @override
  Widget build(BuildContext context) {
    const dateTextStyle = TextStyle(
        fontSize: 10, color: Colors.teal, fontWeight: FontWeight.bold);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200 / 896.0 * MediaQuery.of(context).size.height,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Color(0xFFECF4F3).withOpacity(0.9),
            ),
            touchCallback: (LineTouchResponse touchResponse) {},
            handleBuiltInTouches: true,
            touchSpotThreshold: 15,
          ),
          lineBarsData: [
            LineChartBarData(
              shadow: Shadow(
                color: Colors.black12,
                offset: Offset(0.1, 1.2),
                blurRadius: 2,
              ),
              spots: widget.dValue == '7 Days'
                  ? [
                      FlSpot(0, widget.ydata[6]),
                      FlSpot(1, widget.ydata[5]),
                      FlSpot(2, widget.ydata[4]),
                      FlSpot(3, widget.ydata[3]),
                      FlSpot(4, widget.ydata[2]),
                      FlSpot(5, widget.ydata[1]),
                      FlSpot(6, widget.ydata[0]),
                    ]
                  : [
                      FlSpot(0, widget.ydata[20]),
                      FlSpot(1, widget.ydata[19]),
                      FlSpot(2, widget.ydata[18]),
                      FlSpot(3, widget.ydata[17]),
                      FlSpot(4, widget.ydata[16]),
                      FlSpot(5, widget.ydata[15]),
                      FlSpot(6, widget.ydata[14]),
                      FlSpot(7, widget.ydata[13]),
                      FlSpot(8, widget.ydata[12]),
                      FlSpot(9, widget.ydata[11]),
                      FlSpot(10, widget.ydata[10]),
                      FlSpot(11, widget.ydata[9]),
                      FlSpot(12, widget.ydata[8]),
                      FlSpot(13, widget.ydata[7]),
                      FlSpot(14, widget.ydata[6]),
                      FlSpot(15, widget.ydata[5]),
                      FlSpot(16, widget.ydata[4]),
                      FlSpot(17, widget.ydata[3]),
                      FlSpot(18, widget.ydata[2]),
                      FlSpot(19, widget.ydata[1]),
                      FlSpot(20, widget.ydata[0]),
                    ],
              isCurved: true,
              isStrokeCapRound: true,
              curveSmoothness: 0.4,
              barWidth: 3,
              colors: [
                Colors.teal,
              ],
              dotData: FlDotData(
                show: false,
                dotSize: 6.0,
              ),
            ),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 10,
                textStyle: dateTextStyle,
                getTitles: (value) {
                  if (widget.dValue == '7 Days') {
                    switch (value.toInt()) {
                      case 0:
                        return widget.xdata[6];
                      case 1:
                        return widget.xdata[5];
                      case 2:
                        return widget.xdata[4];
                      case 3:
                        return widget.xdata[3];
                      case 4:
                        return widget.xdata[2];
                      case 5:
                        return widget.xdata[1];
                      case 6:
                        return widget.xdata[0];
                      default:
                        return '';
                    }
                  } else {
                    switch (value.toInt()) {
                      case 0:
                        return widget.xdata[20].split('/')[0];
                      case 1:
                        return widget.xdata[19].split('/')[0];
                      case 2:
                        return widget.xdata[18].split('/')[0];
                      case 3:
                        return widget.xdata[17].split('/')[0];
                      case 4:
                        return widget.xdata[16].split('/')[0];
                      case 5:
                        return widget.xdata[15].split('/')[0];
                      case 6:
                        return widget.xdata[14].split('/')[0];
                      case 7:
                        return widget.xdata[13].split('/')[0];
                      case 8:
                        return widget.xdata[12].split('/')[0];
                      case 9:
                        return widget.xdata[11].split('/')[0];
                      case 10:
                        return widget.xdata[10].split('/')[0];
                      case 11:
                        return widget.xdata[9].split('/')[0];
                      case 12:
                        return widget.xdata[8].split('/')[0];
                      case 13:
                        return widget.xdata[7].split('/')[0];
                      case 14:
                        return widget.xdata[6].split('/')[0];
                      case 15:
                        return widget.xdata[5].split('/')[0];
                      case 16:
                        return widget.xdata[4].split('/')[0];
                      case 17:
                        return widget.xdata[3].split('/')[0];
                      case 18:
                        return widget.xdata[2].split('/')[0];
                      case 19:
                        return widget.xdata[1].split('/')[0];
                      case 20:
                        return widget.xdata[0].split('/')[0];
                      default:
                        return '';
                    }
                  }
                }),
            leftTitles: SideTitles(
              showTitles: false,
            ),
          ),
          axisTitleData: FlAxisTitleData(
              leftTitle:
                  AxisTitle(showTitle: false, titleText: 'Value', margin: 4),
              bottomTitle: AxisTitle(
                  showTitle: false,
                  margin: 0,
                  titleText: '2019',
                  textStyle: dateTextStyle,
                  textAlign: TextAlign.right)),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.black12,
                strokeWidth: 0.6,
              );
            },
          ),
          borderData: FlBorderData(
              show: true, border: Border.all(color: Colors.white, width: 1)),
        ),
      ),
    );
  }
}
