import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/screens/add_user.dart';
import 'package:qmma_flutter/ui/screens/dashboard.dart';
import 'package:qmma_flutter/ui/widgets/responsive_builder.dart';
import 'package:qmma_flutter/ui/widgets/sidebar_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, Widget> _navItems = {
    'dashboard': const Dashboard(),
    'add_user': const AddUser(),
  };

  String _navItemName = 'dashboard';

  void _onItemTapped(String value) {
    setState(() {
      _navItemName = value;
      print(_navItemName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _buildMobileLayout(),
      tablet: _buildDesktopLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.purple,
        title: const Text("QMMA"),
      ),
      body: Row(
        children: [
          // Sidebar Navigation
          SizedBox(
            width: 250,
            child: SidebarNav(
              onItemTapped: _onItemTapped,
              navItemName: _navItemName,
            ),
          ),

          // Outlet for Desktop Dashboard
          Expanded(
            child: _navItems[_navItemName]!,
          ),
        ],
      ),
    );
  }
  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.purple,
        title: const Text("QMMA"),
      ),
      drawer: SidebarNav(
        onItemTapped: _onItemTapped,
        navItemName: _navItemName,
      ),
      body: _navItems[_navItemName],
    );
  }


}
