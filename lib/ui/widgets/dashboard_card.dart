import 'package:flutter/material.dart';


class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.teal,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Total Students", style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
            Text("250", style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
          ],
        ),
      ),
    );
  }
}
