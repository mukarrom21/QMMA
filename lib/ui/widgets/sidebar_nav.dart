import 'package:flutter/material.dart';
import 'package:qmma_flutter/data/data/nav_item_data.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';
import 'package:qmma_flutter/ui/widgets/nav_item_tile.dart';

class SidebarNav extends StatefulWidget {
  const SidebarNav({
    super.key,
    required this.onItemTapped,
    required this.path,
  });

  /// this function is called on NavItemTile widget
  /// this is defined on HomeScreen
  final Function(String selectedNavItemPath) onItemTapped;
  final String path;

  @override
  State<SidebarNav> createState() => _SidebarNavState();
}

class _SidebarNavState extends State<SidebarNav> {
  final Color primary = QmColor.primary;
  final Color secondary = QmColor.secondary;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [

            /// Header
            _buildDrawerHeader(),

            /// Nav Items
            for (var item in navItemDataList)
              item.path != null
                  ? NavItemTile(
                widget: widget,
                path: item.path!,
                itemName: item.name,
                icon: item.icon,
              )
                  : ExpansionTile(
                title: Text(item.name),
                leading: Icon(item.icon),
                backgroundColor: primary.withOpacity(0.05),
                // initiallyExpanded: isExpanded,
                childrenPadding: const EdgeInsets.only(left: 20),
                subtitle: const Text("Click to view more"),
                children: [
                  for (var child in item.children)
                    NavItemTile(
                      widget: widget,
                      path: child.path!,
                      itemName: child.name,
                      icon: child.icon,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return DrawerHeader(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primary,
                width: 1,
              ),
            ),
            child: Image.network(
              "https://images.pexels.com/photos/14589344/pexels-photo-14589344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "মোকাররম হোসাইন",
            style: TextStyle(
              color: primary,
              fontSize: 16,
            ),
          ),
          Text(
            "mukarrom@qmma.com",
            style: TextStyle(
              color: primary,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
