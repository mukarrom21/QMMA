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
  Offset _tapPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
          hoverColor: Colors.white,
          onPressed: () {},
          icon: const Icon(
            Icons.add_circle,
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
            foregroundColor: const WidgetStatePropertyAll(QmColor.primary),
          ),
          tooltip: "Add new student",
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 10,
        title: const Text(
          "Students",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: QmColor.primary,
            ),
            tooltip: "Settings",
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // _buildHeaderSection(),
            _buildDataTableSection(context)
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableSection(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _tapPosition = details.globalPosition;
          });
        },
        child: DataTable2(
          columnSpacing: 12,
          isHorizontalScrollBarVisible: true,
          horizontalMargin: 12,
          minWidth: 800,
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
                // fixedWidth: 50,
                label: const Center(child: Text("id")),
                onSort: (columnIndex, ascending) {
                  // do something
                }),
            const DataColumn2(
              // fixedWidth: 150,
              label: Center(child: Text("Name")),
            ),
            const DataColumn2(
              // fixedWidth: 150,
              label: Center(child: Text("Father name")),
            ),
            const DataColumn2(
              // fixedWidth: 70,
              label: Center(child: Text("Class")),
            ),
            const DataColumn2(
              // fixedWidth: 200,
              label: Center(child: Text("Mobile")),
            ),
          ],
          rows: List<DataRow>.generate(
            100,
            (int index) => DataRow2(
              /// On Mouse Right Button Click show popup menu
              onSecondaryTapDown: (details) {
                _onSecondaryTapShowPopupMenu(
                  context,
                  details.globalPosition,
                );
              },

              /// On Long Press show popup menu
              onLongPress: () {
                _onSecondaryTapShowPopupMenu(context, _tapPosition);
              },

              cells: [
                DataCell(Center(child: Text("std$index"))),
                const DataCell(Center(child: Text("Abdullah al Araf"))),
                const DataCell(Center(child: Text("Abu Abdullah"))),
                DataCell(Center(child: Text("Class $index"))),
                const DataCell(Center(child: Text("+880 190 903 7017"))),
              ],
            ),
          ),
        ),
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
  }
}
