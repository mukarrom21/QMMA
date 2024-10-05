import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/widgets/dashboard_card.dart';
import 'package:qmma_flutter/ui/widgets/pi_chart.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Dashboard"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // direction: Axis.horizontal,
              children: [
                DashboardCard(),
                DashboardCard(),
                DashboardCard(),
                DashboardCard(),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: PieChartSample2(),
          )
        ],
      ),
    );
  }
}
