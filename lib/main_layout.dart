import 'package:flutter/material.dart';
import 'package:qmma_flutter/data/data/nav_item_data.dart';
import 'package:qmma_flutter/ui/widgets/responsive_builder.dart';
import 'package:qmma_flutter/ui/widgets/sidebar_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedNavItemPath = 'dashboard';

  void _onItemTapped(String selectedItemPath) {
    setState(() {
      _selectedNavItemPath = selectedItemPath;
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(
              trailing: [Icon(Icons.search)],
              constraints: BoxConstraints(
                maxWidth: 400,
                minWidth: 200,
              ),
              padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
              hintText: "Search here...",
              hintStyle: WidgetStatePropertyAll(
                TextStyle(color: Colors.blue),
              ),
            ),
          ),
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
              path: _selectedNavItemPath,
            ),
          ),

          // Outlet for Desktop Dashboard
          Expanded(
            child: _buildNavItemWidget()[_selectedNavItemPath]!,
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
        path: _selectedNavItemPath,
      ),
      // body: navItems[_selectedNavItemPath],
      body: _buildNavItemWidget()[_selectedNavItemPath],
    );
  }

  /// returns a map like: { dashboard: Dashboard(), users: Users(), ... }
  Map<String, Widget> _buildNavItemWidget() {
    Map<String, Widget> navItems = {};
    for (var element in navItemDataList) {
      if (element.path != null) {
        navItems[element.path!] = element.screen!;
      } else {
        for (var child in element.children) {
          navItems[child.path!] = child.screen!;
        }
      }
      setState(() {});
    }
    return navItems;
  }
}
