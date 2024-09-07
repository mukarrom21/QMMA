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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile option
              ListTile(
                // leading: Icon(Icons.person, color: Colors.purple),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Icon(Icons.person, color: primary)),
                    Text(
                      "Mukarrom Hosain",
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
                // subtitle: Text("mukarrom@qmma.com",
                //     style: TextStyle(color: Colors.purple)),
                trailing: Icon(Icons.logout, color: primary),
              ),
              Divider(
                color: primary,
                height: 1,
              ),
          
              // Dashboard option
              NavItemTile(
                widget: widget,
                path: "dashboard",
                itemName: "Dashboard",
                icon: Icons.dashboard,
              ),
          
              const Divider(
                color: Colors.purple,
                height: 1,
              ),
          
              // User Expanded Tile
              ExpansionTile(
                title: const Text("User"),
                leading: const Icon(Icons.person),
                childrenPadding: const EdgeInsets.only(left: 20),
                children: [
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Add User
                  NavItemTile(
                    widget: widget,
                    path: "add-user",
                    itemName: "Add User",
                    icon: Icons.person_add,
                  ),
                ],
              ),
          
              const Divider(
                color: Colors.purple,
                height: 1,
              ),
          
              // Student expansion tile
              ExpansionTile(
                title: const Text("Students"),
                leading: const Icon(Icons.people_alt_rounded),
                childrenPadding: const EdgeInsets.only(left: 20),
                children: [
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Students option
                  NavItemTile(
                    widget: widget,
                    path: "students",
                    itemName: "Students",
                    icon: Icons.people_alt_rounded,
                  ),
          
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Session option
                  NavItemTile(
                    widget: widget,
                    path: "session",
                    itemName: "Session",
                    icon: Icons.lock_clock,
                  ),
          
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Class option
                  NavItemTile(
                    widget: widget,
                    path: "class",
                    itemName: "Class",
                    icon: Icons.class_,
                  ),
          
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Class Group option
                  NavItemTile(
                    widget: widget,
                    path: "class-group",
                    itemName: "Class Group",
                    icon: Icons.group_work_outlined,
                  ),
                ],
              ),
              const Divider(
                color: Colors.purple,
                height: 1,
              ),
          
              // Examination Expansion Tile
              ExpansionTile(
                title: const Text("Examination"),
                leading: const Icon(Icons.chevron_right),
                childrenPadding: const EdgeInsets.only(left: 20),
                children: [
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Exam Name option
                  NavItemTile(
                    widget: widget,
                    path: "exam-name",
                    itemName: "Exam Name",
                    icon: Icons.pageview_rounded,
                  ),
          
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Exam Fee option
                  NavItemTile(
                    widget: widget,
                    path: "exam-fee",
                    itemName: "Exam Fee",
                    icon: Icons.money,
                  ),
                ],
              ),
          
              const Divider(
                color: Colors.purple,
                height: 1,
              ),
          
              // Accounting Expansion Tile
              ExpansionTile(
                title: const Text("Accounting"),
                leading: const Icon(Icons.chevron_right),
                // backgroundColor: Colors.purple,
                // backgroundColor: Color(0xFFD5AADCFF),
                // collapsedBackgroundColor: Colors.purple,
                childrenPadding: const EdgeInsets.only(left: 20),
                children: [
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
                  // Session option
                  const ListTile(
                    leading: Icon(Icons.chevron_right),
                    title: Text("Fee Collection"),
                  ),
          
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          
                  // Expense option
                  const ListTile(
                    leading: Icon(Icons.chevron_right),
                    title: Text("Expense"),
                  ),
                ],
              ),
          
              Divider(
                color: Colors.purple,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
