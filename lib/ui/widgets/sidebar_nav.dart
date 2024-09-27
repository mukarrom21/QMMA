import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';
import 'package:qmma_flutter/ui/widgets/nav_item_tile.dart';

class SidebarNav extends StatefulWidget {
  const SidebarNav({
    super.key,
    required this.onItemTapped,
    required this.path,
  });

  final Function(String) onItemTapped;
  final String path;

  @override
  State<SidebarNav> createState() => _SidebarNavState();
}

class _SidebarNavState extends State<SidebarNav> {
  final Color primary = QmColor.primary;
  final Color secondary = QmColor.secondary;

  List<Map> navItemList = [
    {"path": "dashboard", "name": "Dashboard", "icon": Icons.dashboard},
    {"path": "users", "name": "Users", "icon": Icons.person},
    {"path": "students", "name": "Students", "icon": Icons.book},
    {"name": "Talimat", "icon": Icons.book_outlined, "children": [
      {"path": "session", "name": "শিক্ষাবর্ষ", "icon": Icons.book_outlined},
      {"path": "class", "name": "ক্লাশ", "icon": Icons.class_outlined},
      {"path": "class_group", "name": "গ্রুপ", "icon": Icons.group_outlined},
      {"path": "book", "name": "কিতাব", "icon": Icons.book_outlined},
    ]},
  ];
  Map<String, IconData> pathsMap = {
    "dashboard": Icons.dashboard,
    "users": Icons.person,
    "students": Icons.book,
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            /// Header
            _buildDrawerHeader(),

            for (var path in navItemList)
             path["children"] == null ? NavItemTile(
                widget: widget,
                path: path["path"],
                itemName: path["name"],
                icon: path["icon"],
              ) : ExpansionTile(
                title: Text(path["name"]),
                leading: Icon(path["icon"]),
                initiallyExpanded: path["path"] == widget.path,
                childrenPadding: const EdgeInsets.only(left: 20),
                subtitle: const Text("Click to view more"),
                children: [
                  for (var child in path["children"])
                    NavItemTile(
                      widget: widget,
                      path: child["path"],
                      itemName: child["name"],
                      icon: child["icon"],
                    ),
                ],
              )
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
