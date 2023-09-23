import 'package:admin/admin.dart';

class DailyUserBarChart extends StatelessWidget {
  const DailyUserBarChart({
    super.key,
    required this.isShowingMainData,
    required this.items,
  });
  final List<int> items;
  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: -0.5,
        backgroundColor: ApplicationColors.pageBackground,
      );

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData {
    return <LineChartBarData>[
      lineChartBarData,
    ];
  }

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: AppFonts.bold14.apply(
          color: ApplicationColors.white,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = AppFonts.bold14.apply(
      color: ApplicationColors.white,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('Сен', style: style);
        break;
      case 7:
        text = Text('Окт', style: style);
        break;
      case 12:
        text = Text('Дек', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(
        show: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: ApplicationColors.primary.withOpacity(0.2),
            width: 4,
          ),
          left: const BorderSide(
            width: Dimensions.SIZE_0,
            color: ApplicationColors.borderColor,
          ),
          right: const BorderSide(
            color: ApplicationColors.transparient,
          ),
          top: const BorderSide(
            color: ApplicationColors.transparient,
          ),
        ),
      );

  LineChartBarData get lineChartBarData => LineChartBarData(
        isCurved: true,
        color: ApplicationColors.contentColorYellow,
        barWidth: 10,
        isStrokeCapRound: false,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: items.asMap().entries.map((MapEntry<int, int> index) {
          return FlSpot(
            index.key.toDouble(),
            index.value.toDouble(),
          );
        }).toList(),
      );
}
