import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class ClassGroupScreen extends StatefulWidget {
  const ClassGroupScreen({super.key});

  @override
  State<ClassGroupScreen> createState() => _ClassGroupScreenState();
}

class _ClassGroupScreenState extends State<ClassGroupScreen> {
  Offset _tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onSecondaryTapDown: (details) {
            // _onSecondaryTapShowPopupMenu(0, details.globalPosition);
          },
          child: const Text('Right Click to Open Modal'),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onSecondaryTapDown: (details) {
                _onSecondaryTapShowPopupMenu(context, details.globalPosition);
              },
              onTapDown: (details){
                setState(() {
                  _tapPosition = details.globalPosition;
                });
              },
              onLongPress: () {
                _onSecondaryTapShowPopupMenu(context, _tapPosition);
              },
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn(label: Text('Column A')),
                  DataColumn(label: Text('Column B')),
                  DataColumn(label: Text('Column C')),
                  DataColumn(label: Text('Column D')),
                ],
                rows: List<DataRow>.generate(
                  100,
                  (index) => DataRow2(
                    onSecondaryTap: () {
                      // Show popup menu on secondary tap
                      showMenu(
                        context: context,
                        position: RelativeRect.fromRect(
                          Rect.fromPoints(
                            Offset(index * 50, 0),
                            Offset(index * 50 + 50, 50),
                          ),
                          Offset.zero & MediaQuery.of(context).size,
                        ),
                        items: _createPopupMenu(index).itemBuilder(context),
                        elevation: 8,
                      ).then((int? value) {
                        // Handle popup menu selection result here
                        if (value != null) {
                          print('Selected option: $value');
                        }
                      });
                    },
                    cells: [
                      DataCell(Text('A$index')),
                      DataCell(Text('B$index')),
                      DataCell(Text('C$index')),
                      DataCell(Text('D$index')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Context Menu
        ],
      ),
    );
  }

  PopupMenuButton<int> _createPopupMenu(int index) {
    return PopupMenuButton<int>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 0,
          child: Text('Option 1'),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Option 2'),
        ),
      ],
      onSelected: (int value) {
        // Handle popup menu item selection here
        print('Selected option: $value');
      },
    );
  }

  void _onSecondaryTapShowPopupMenu(BuildContext context, Offset tapPosition) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          tapPosition.dx, // X position of the tap
          tapPosition.dy, // Y position of the tap
          tapPosition.dx, // Right offset (not used)
          tapPosition.dy // Bottom offset (not used)
          ),
      items: [
        const PopupMenuItem(
          value: 'view',
          child: Text('View'),
        ),
        const PopupMenuItem(
          value: 'sort',
          child: Text('Sort'),
        ),
        const PopupMenuItem(
          value: 'refresh',
          child: Text('Refresh'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        _handleMenuSelection(value);
      }
    });
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'view':
        print("View option selected");
        break;
      case 'sort':
        print("Sort option selected");
        break;
      case 'refresh':
        print("Refresh option selected");
        break;
    }
  }
}
