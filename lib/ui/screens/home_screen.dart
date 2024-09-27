import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/screens/add_user.dart';
import 'package:qmma_flutter/ui/screens/dashboard.dart';
import 'package:qmma_flutter/ui/screens/examination/exam_fee_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/exam_name_screen.dart';
import 'package:qmma_flutter/ui/screens/students/book_screen.dart';
import 'package:qmma_flutter/ui/screens/students/class_group_screen.dart';
import 'package:qmma_flutter/ui/screens/students/class_screen.dart';
import 'package:qmma_flutter/ui/screens/students/session_screen.dart';
import 'package:qmma_flutter/ui/screens/students/students_screen.dart';
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
    'add-user': const AddUser(),
    'session': const SessionScreen(),
    'class': const ClassScreen(),
    'class-group': const ClassGroupScreen(),
    'students': const StudentsScreen(),
    'exam-name': const ExamNameScreen(),
    'exam-fee': const ExamFeeScreen(),
    'book': const BookScreen(),
  };

  String _navItemPathName = 'dashboard';

  void _onItemTapped(String value) {
    setState(() {
      _navItemPathName = value;
      // print(_navItemName);
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250,
            child: SidebarNav(
              onItemTapped: _onItemTapped,
              path: _navItemPathName,
            ),
          ),

          // Outlet for Desktop Dashboard
          Expanded(
            child: _navItems[_navItemPathName]!,
          ),

          // Footer
          const SizedBox(
            height: 20,
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
        path: _navItemPathName,
      ),
      body: _navItems[_navItemPathName],
    );
  }
}
