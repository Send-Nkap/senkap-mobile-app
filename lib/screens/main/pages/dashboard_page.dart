import 'package:flutter/material.dart';
import 'package:senkap/models/chart_model.dart';
import 'package:senkap/ressources/app_colors.dart';
import 'package:senkap/ressources/app_styles.dart';
import 'package:senkap/ressources/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ChartData> data = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)
  ];
  List<ChartData> data2 = [
    ChartData('Jan', 0),
    ChartData('Feb', 12),
    ChartData('Mar', 7),
    ChartData('Apr', 21),
    ChartData('May', 80)
  ];
  List<ChartData> pieChartData = [
    ChartData('Recharge', 35),
    ChartData('Withdraw', 28),
    ChartData('Transfer', 34),
  ];
  final TooltipBehavior _doughnutTooltip = TooltipBehavior(enable: true);
  // final TooltipBehavior _sfCartesianChartTooltip =
  //     TooltipBehavior(enable: true, format: );
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Transactions",
          style: AppStyles.textStyle(
            color: AppColors.primaryText,
            weight: FontWeight.w600,
            size: 18,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: AppColors.bgOpacColor,
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
        ),
        child: SfCircularChart(
            palette: [
              AppColors.success,
              AppColors.primary,
              AppColors.secondary
            ],
            tooltipBehavior: _doughnutTooltip,
            series:
                // <CircularSeries>[
                //   DoughnutSeries<_ChartData, String>(
                //       dataSource: data,
                //       xValueMapper: (_ChartData data, _) => data.x,
                //       yValueMapper: (_ChartData data, _) => data.y,
                //       // Explode the segments on tap
                //       explode: true,
                //       explodeIndex: 1)
                // ]
                [
              DoughnutSeries<ChartData, String>(
                dataSource: pieChartData,
                xValueMapper: (ChartData datas, _) => datas.x,
                yValueMapper: (ChartData datas, _) => datas.y,
                // name: widget.name,
                // explode: true,
                enableTooltip: true,
                innerRadius: '70%',
                // radius: '70%',
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle: AppStyles.textStyle(color: AppColors.primary),
                    // Positioning the data label
                    labelPosition: ChartDataLabelPosition.outside),
              ),
            ]),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Incomes/Expenses",
          style: AppStyles.textStyle(
            color: AppColors.primaryText,
            weight: FontWeight.w600,
            size: 18,
          ),
        ),
      ),
      //Initialize the chart widget
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.bgOpacColor,
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
        ),
        child: SfCartesianChart(
            enableAxisAnimation: true,
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0.0),
              minorGridLines: const MinorGridLines(width: 0.0),
              // majorTickLines: const MajorTickLines(width: 0.0),
              minorTickLines: const MinorTickLines(width: 0.0),
            ),
            primaryYAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0.0),
              minorGridLines: const MinorGridLines(width: 0.0),
              // majorTickLines: const MajorTickLines(width: 0.0),
              minorTickLines: const MinorTickLines(width: 0.0),
            ),
            // Chart title
            // title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
            // Enable tooltip
            // tooltipBehavior: _sfCartesianChartTooltip,
            series: <ChartSeries<ChartData, String>>[
              LineSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData sales, _) => sales.x,
                  yValueMapper: (ChartData sales, _) => sales.y,
                  name: 'Icommes',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
              LineSeries<ChartData, String>(
                  color: AppColors.accent,
                  dataSource: data2,
                  xValueMapper: (ChartData sales, _) => sales.x,
                  yValueMapper: (ChartData sales, _) => sales.y,
                  name: 'Expenses',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]),
      ),
    ]);
  }
}
