import 'package:admin/admin.dart';

class AppBarChart extends StatelessWidget {
  final bool isShowSales;
  final List<int> orders;
  final List<int> users;

  const AppBarChart({
    required this.users,
    required this.isShowSales,
    required this.orders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowSales ? salesData : usersData,
      duration: DurationEnum.high.duration,
    );
  }

  LineChartData get salesData => LineChartData(
        lineTouchData: salesLineTouchData,
        gridData: gridData,
        titlesData: salesTitle,
        borderData: borderData,
        lineBarsData: salesBarData,
        minX: Dimensions.SIZE_0,
        maxX: Dimensions.SIZE_14,
        maxY: Dimensions.SIZE_4,
        minY: Dimensions.SIZE_0,
      );

  LineChartData get usersData => LineChartData(
        lineTouchData: usersLineTouchData,
        gridData: gridData,
        titlesData: usersTitlesData,
        borderData: borderData,
        lineBarsData: <LineChartBarData>[
          usersChartBarData,
        ],
        minX: Dimensions.SIZE_0,
        maxX: Dimensions.SIZE_14,
        maxY: Dimensions.SIZE_6,
        minY: Dimensions.SIZE_0,
      );

  LineTouchData get salesLineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(Dimensions.SIZE_0_8),
        ),
      );

  FlTitlesData get salesTitle => FlTitlesData(
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

  List<LineChartBarData> get salesBarData => <LineChartBarData>[
        orderChartBarData,
      ];

  LineTouchData get usersLineTouchData => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get usersTitlesData => FlTitlesData(
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

  Widget leftTitleWidgets(
    double value,
    TitleMeta meta,
  ) {
    TextStyle style = AppFonts.bold14.apply(color: ApplicationColors.white);
    String text;
    switch (value.toInt()) {
      case 1:
        text = StringConstant.one;
        break;
      case 2:
        text = StringConstant.two;
        break;
      case 3:
        text = StringConstant.three;
        break;
      case 4:
        text = StringConstant.four;
        break;
      case 5:
        text = StringConstant.five;
        break;
      case 6:
        text = StringConstant.six;
        break;

      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: Dimensions.SIZE_1,
        reservedSize: Dimensions.SIZE_40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = AppFonts.bold14.apply(color: ApplicationColors.white);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text(StringConstant.september, style: style);
        break;
      case 7:
        text = Text(StringConstant.october, style: style);
        break;
      case 12:
        text = Text(StringConstant.december, style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: Dimensions.SIZE_10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: Dimensions.SIZE_30,
        interval: Dimensions.SIZE_1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
              color: ApplicationColors.primary.withOpacity(Dimensions.SIZE_0_2),
              width: Dimensions.SIZE_4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get orderChartBarData => LineChartBarData(
        isCurved: true,
        color: ApplicationColors.contentColorGreen
            .withOpacity(Dimensions.SIZE_0_6),
        barWidth: Dimensions.SIZE_6,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: ApplicationColors.contentColorGreen
              .withOpacity(Dimensions.SIZE_0_2),
        ),
        spots: orders
            .asMap()
            .entries
            .map((MapEntry<int, int> index) =>
                FlSpot(index.key.toDouble(), index.value.toDouble()))
            .toList(),
      );

  LineChartBarData get usersChartBarData => LineChartBarData(
      isCurved: true,
      color:
          ApplicationColors.contentColorPink.withOpacity(Dimensions.SIZE_0_6),
      barWidth: Dimensions.SIZE_6,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color:
            ApplicationColors.contentColorPink.withOpacity(Dimensions.SIZE_0_2),
      ),
      spots: users
          .asMap()
          .entries
          .map((MapEntry<int, int> index) =>
              FlSpot(index.key.toDouble(), index.value.toDouble()))
          .toList());
}
