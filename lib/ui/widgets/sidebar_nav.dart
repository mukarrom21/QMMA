import 'package:flutter/material.dart';

class SidebarNav extends StatefulWidget {
  const SidebarNav({
    super.key,
    required this.onItemTapped,
    required this.navItemName,
  });

  final Function(String) onItemTapped;
  final String navItemName;

  @override
  State<SidebarNav> createState() => _SidebarNavState();
}

class _SidebarNavState extends State<SidebarNav> {
  @override
  Widget build(BuildContext context) {
    Color? navColor(String navItemName, Color? color) {
      if (navItemName == widget.navItemName) {
        return color;
      }
      return null;
    }

    return Drawer(
      // width: 10,
      child: SafeArea(
        child: Column(
          children: [
            // Profile option
            const ListTile(
              // leading: Icon(Icons.person, color: Colors.purple),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(child: Icon(Icons.person, color: Colors.purple)),
                  Text(
                    "Mukarrom Hosain",
                    style: TextStyle(color: Colors.purple),
                  ),
                  Text(
                    "mukarrom@qmma.com",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              // subtitle: Text("mukarrom@qmma.com",
              //     style: TextStyle(color: Colors.purple)),
              trailing: Icon(Icons.logout, color: Colors.purple),
            ),
            const Divider(
              color: Colors.purple,
              height: 1,
            ),

            // Dashboard option
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: navColor("dashboard", Colors.white),
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(
                  color: navColor("dashboard", Colors.white),
                ),
              ),
              // trailing: Icon(Icons.chevron_right, color: Colors.white),
              tileColor: navColor("dashboard", Colors.purple),
              // contentPadding: EdgeInsets.zero,
              onTap: () => widget.onItemTapped("dashboard"),
            ),

            const Divider(
              color: Colors.purple,
              height: 1,
            ),

            // User Expanded Tile
            ExpansionTile(
              title: const Text("User"),
              leading: const Icon(Icons.person),
              // backgroundColor: Colors.purple,
              // backgroundColor: Color(0xFFD5AADCFF),
              // collapsedBackgroundColor: Colors.purple,
              // childrenPadding: const EdgeInsets.only(left: 20),
              children: [
                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                // Session option
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 40),
                  tileColor: navColor("add_user", Colors.purple),
                  leading: Icon(
                    Icons.add_circle_outline,
                    color: navColor(
                      "add_user",
                      Colors.white,
                    ),
                  ),
                  title: Text(
                    "Add User",
                    style: TextStyle(
                      color: navColor(
                        "add_user",
                        Colors.white,
                      ),
                    ),
                  ),
                  onTap: () => widget.onItemTapped("add_user"),
                ),

                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
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
                  title: Text("Session"),
                ),

                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                ),

                // Class option
                const ListTile(
                  leading: Icon(Icons.chevron_right),
                  title: Text("Class"),
                ),

                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                ),

                // Class Group option
                const ListTile(
                  leading: Icon(Icons.chevron_right),
                  title: Text("Class Group"),
                ),

                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                ),

                // Add user option
                const ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Admission"),
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
    );
  }
}
