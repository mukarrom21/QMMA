import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';
import 'package:qmma_flutter/ui/widgets/sidebar_nav.dart';

class NavItemTile extends StatelessWidget {
  const NavItemTile({
    super.key,
    required this.widget,
    required this.path,
    required this.itemName,
    required this.icon,
  });

  final SidebarNav widget; /// receives widget from SidebarNav widget
  final String path;
  final String itemName;
  final IconData icon;

  /// if path == widget.path, return color
  Color? navColor(String path, Color? color) {
    if (path == widget.path) {
      return color;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: navColor(path, QmColor.primary),
      leading: Icon(icon, color: navColor(path, Colors.white)),
      title: Text(
        itemName,
        style: TextStyle(
          /// color: call navColor function,
          color: navColor(path, Colors.white),
        ),
      ),
      /// widget receives onItemTapped function from SidebarNav widget
      /// path is passed from SidebarNav widget received from NavItemTile above
      onTap: () => widget.onItemTapped(path),
    );
  }
}
