import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  List<int> selectedRowIndices = [];

  Offset? _menuPosition; // To store the position for the context menu
  bool _isMenuVisible = false; // To control visibility of the menu

  void _showContextMenu(Offset position) {
    setState(() {
      _menuPosition = position;
      _isMenuVisible = true;
    });
  }

  void _hideContextMenu() {
    setState(() {
      _isMenuVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          /// Header section
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Students",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      tooltip: "Add new student",
                    ),
                    const Spacer(),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                      ),
                      tooltip: "Settings",
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Data table section
          Expanded(
            child: DataTable2(
              columnSpacing: 12,
              isHorizontalScrollBarVisible: true,
              horizontalMargin: 12,
              minWidth: 1000,
              isVerticalScrollBarVisible: true,
              horizontalScrollController: ScrollController(
                debugLabel: 'horizontalScrollController',
              ),
              // checkboxAlignment: Alignment.centerLeft,
              headingRowColor: const WidgetStatePropertyAll(QmColor.primary),
              headingTextStyle: const TextStyle(
                color: Colors.white,
              ),
              headingCheckboxTheme: const CheckboxThemeData(
                fillColor: WidgetStatePropertyAll(QmColor.primary),
                checkColor: WidgetStatePropertyAll(Colors.white),
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              columns: [
                DataColumn2(
                    fixedWidth: 50,
                    label: const Text("id"),
                    onSort: (columnIndex, ascending) {
                      // do something
                    }),
                const DataColumn2(
                  fixedWidth: 150,
                  label: Text("Name"),
                ),
                const DataColumn2(
                  fixedWidth: 150,
                  label: Text("Father name"),
                ),
                const DataColumn2(
                  fixedWidth: 70,
                  label: Text("Class"),
                ),
                const DataColumn2(
                  fixedWidth: 200,
                  label: Text("Mobile"),
                ),
              ],
              rows: List<DataRow>.generate(
                100,
                (int index) => DataRow2(
                  onSecondaryTapDown: (details) {
                    _onSecondaryTapShowPopupMenu(
                      context,
                      details.globalPosition,
                    );
                  },
                  // onLongPress: (details) {
                  //   _onSecondaryTapShowPopupMenu(
                  //     context,
                  //     details.globalPosition,
                  //   );
                  // },
                  cells: [
                    DataCell(Text("std$index")),
                    const DataCell(Text("Abdullah al Araf")),
                    const DataCell(Text("Abu Abdullah")),
                    DataCell(Text("Class $index")),
                    const DataCell(Text("+880 190 903 7017")),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onSecondaryTapShowPopupMenu(
    BuildContext context,
    Offset tapPosition,
  ) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          tapPosition.dx, // X position of the tap
          tapPosition.dy, // Y position of the tap
          tapPosition.dx, // X position of the tap
          tapPosition.dy // Y position of the tap
          ),
      items: [
        PopupMenuItem(
          onTap: () {},
          value: 'view',
          child: const Row(
            children: [
              Icon(Icons.view_list_rounded),
              SizedBox(
                width: 10,
              ),
              Text('View Details'),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {},
          value: 'add_image',
          child: const Row(
            children: [
              Icon(Icons.add_a_photo_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Add Image'),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {},
          value: 'change_class',
          child: const Row(
            children: [
              Icon(Icons.change_circle),
              SizedBox(
                width: 10,
              ),
              Text('Change class'),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {},
          value: 'change_group',
          child: const Row(
            children: [
              Icon(Icons.group_work_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Change group'),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {},
          value: 'delete',
          child: const Row(
            children: [
              Icon(Icons.delete),
              SizedBox(
                width: 10,
              ),
              Text('Delete'),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    );
    //     .then(
    //   (value) {
    //     if (value != null) {
    //       _handleMenuSelection(value);
    //     }
    //   },
    // );
  }

// void _handleMenuSelection(String value) {
//   switch (value) {
//     case 'view':
//       print("View option selected");
//       break;
//     case 'sort':
//       print("Sort option selected");
//       break;
//     case 'refresh':
//       print("Refresh option selected");
//       break;
//   }
// }
}
