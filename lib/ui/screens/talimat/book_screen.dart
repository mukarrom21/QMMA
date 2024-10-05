import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/widgets/change_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/delete_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import 'package:qmma_flutter/ui/widgets/select_widget.dart';
import '../../utils/qm_color.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Offset _tapPosition = Offset.zero;
  List<int> selectedRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeaderAppBar(),
      body: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _tapPosition = details.globalPosition;
          });
        },
        child: DataTable2(
          minWidth: 1200,
          columnSpacing: 0,
          headingRowColor: const WidgetStatePropertyAll(
            QmColor.primary,
          ),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          border: TableBorder(
            horizontalInside: _buildBorderSide(),
            verticalInside: _buildBorderSide(),
            left: _buildBorderSide(),
            right: _buildBorderSide(),
            bottom: _buildBorderSide(),
          ),
          columns: _buildDataColumns(),
          rows: _buildDataRows(),
        ),
      ),
    );
  }

  BorderSide _buildBorderSide() {
    return const BorderSide(
      color: QmColor.primary,
      width: 1,
    );
  }

  /// Build Header AppBar
 AppBar _buildHeaderAppBar() {
    return AppBar(
      leading: IconButton.outlined(
        hoverColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => _buildAddOrEditDialog(context));
        },
        icon: const Icon(
          Icons.add_circle,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
          foregroundColor: const WidgetStatePropertyAll(QmColor.primary),
        ),
        tooltip: "নতুন কিতাব যুক্ত করুন",
      ),
      iconTheme: const IconThemeData(color: QmColor.primary),
      backgroundColor: Colors.grey.shade200,
      elevation: 10,
      title: const Text(
        "কিতাব",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        SizedBox(
          width: 200,
          height: 40,
          child: SearchBar(
            trailing: [
              IconButton(
                  onPressed: () {},
                  color: QmColor.primary,
                  icon: const Icon(Icons.search)),
            ],
            hintText: "কিতাবের নাম অনুসন্ধান করুন",
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 5)),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: QmColor.primary,
          ),
          tooltip: "Settings",
        )
      ],
    );
  }

  /// Build DataTable2 Columns
  List<DataColumn2> _buildDataColumns() {
    return [
      /// Book ID data column
      DataColumn2(
        fixedWidth: 50,
        label: const Center(child: Text("ID")),
        tooltip: "কিতাবের আইডি",
        onSort: (columnIndex, ascending) {},
      ),

      /// Class name data column
      DataColumn2(
        fixedWidth: 150,
        label: const Center(child: Text("ক্লাশ")),
        tooltip: "ক্লাশের নাম",
        onSort: (columnIndex, ascending) {},
      ),

      /// Books name Bengali data column
      const DataColumn2(
        label: Center(child: Text("কিতাব")),
        tooltip: "কিতাবের নাম (বাংলা)",
        fixedWidth: 200,
      ),

      /// Books name Arabic data column
      const DataColumn2(
        label: Center(child: Text("اسم الكتاب")),
        tooltip: "কিতাবের নাম (আরবি)",
        fixedWidth: 200,
      ),

      /// Books name English data column
      const DataColumn2(
        label: Center(child: Text("Book Name")),
        tooltip: "কিতাবের নাম (ইংরেজি)",
        fixedWidth: 200,
      ),

      /// Status data column
      DataColumn2(
        fixedWidth: 100,
        label: const Center(child: Text("স্ট্যাটাস")),
        tooltip: "কিতাবটির বর্তমান অবস্থা",
        onSort: (columnIndex, ascending) {},
      ),
    ];
  }

  /// Build DataTable2 Rows
  List<DataRow2> _buildDataRows() {
    return List<DataRow2>.generate(
      10,
      (int index) => DataRow2(
        color: index % 2 == 0
            ? WidgetStatePropertyAll(Colors.grey.shade200)
            : null,
        selected: selectedRows.contains(index),
        onSelectChanged: (value) {
          setState(() {
            if (selectedRows.contains(index)) {
              selectedRows.remove(index);
            } else {
              selectedRows.add(index);
            }
          });
        },
        onSecondaryTapDown: (details) {
          setState(() {
            _tapPosition = details.globalPosition;
          });
          _onSecondaryTapShowPopupMenu(
            context,
            index,
          );
        },
        onLongPress: () => _onSecondaryTapShowPopupMenu(context, index),
        cells: [
          DataCell(Center(child: Text('${index + 1}'))),
          DataCell(Center(child: Text('Class ${index + 1}'))),
          DataCell(Center(child: Text('Book ${index + 1}'))),
          DataCell(Center(child: Text('Book ${index + 1}'))),
          DataCell(Center(child: Text('Book ${index + 1}'))),
          const DataCell(Center(child: Center(child: Text("Active")))),
        ],
      ),
    );
  }

  /// Show PopupMenu
  void _onSecondaryTapShowPopupMenu(
    BuildContext context, [
    int index = 0,
  ]) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          _tapPosition.dx, // X position of the tap
          _tapPosition.dy, // Y position of the tap
          _tapPosition.dx, // X position of the tap
          _tapPosition.dy // Y position of the tap
          ),
      items: [
        /// Change ID
        PopupMenuItem(
          onTap: () {},
          value: 'Change ID',
          child: const Tooltip(
            message: 'কিতাবের আইডি পরিবর্তন করুন',
            preferBelow: false,
            child: Row(
              children: [
                Icon(Icons.change_circle),
                SizedBox(
                  width: 10,
                ),
                Text('Change ID'),
              ],
            ),
          ),
        ),

        /// Edit Name
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => _buildAddOrEditDialog(context, index),
            );
          },
          value: 'edit',
          child: const Tooltip(
            message: 'কিতাবের নাম এডিট করুন',
            preferBelow: false,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(
                  width: 10,
                ),
                Text('Edit'),
              ],
            ),
          ),
        ),

        /// Change Status
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ChangeAlertDialog(
                title: 'Status',
              ),
            );
          },
          value: 'change_status',
          child: const Tooltip(
            message: 'কিতাবের স্ট্যাটাস পরিবর্তন করুন',
            preferBelow: false,
            child: Row(
              children: [
                Icon(Icons.sync),
                SizedBox(
                  width: 10,
                ),
                Text('Change Status'),
              ],
            ),
          ),
        ),

        /// Delete
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => DeleteAlertDialog(
                title: 'কিতাব ${index + 1}',
              ),
            );
          },
          value: 'delete',
          child: const Tooltip(
            message: 'কিতাবটি ডিলিট করুন',
            preferBelow: false,
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Delete', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}

Widget _buildAddOrEditDialog(BuildContext context, [int? index]) {
  TextEditingController idTEC = TextEditingController(
    text: index == null ? null : "${index + 1}",
  );
  TextEditingController bookNameBnTEC = TextEditingController(
    text: index == null ? null : "Book ${index + 1}",
  );
  TextEditingController bookNameArTEC = TextEditingController(
    text: index == null ? null : "Book ${index + 1}",
  );
  TextEditingController bookNameEnTEC = TextEditingController(
    text: index == null ? null : "Book ${index + 1}",
  );

  return Dialog(
    child: Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        maxWidth: 300,
        // maxHeight: 600,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        /// Title
        Text(
          index == null ? "নতুন কিতাব যোগ করুন" : "কিতাবের নাম সংশোধন করুন",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        const Gap(20),

        /// Select Class
        SelectWidget(
          labelText: "Select Class",
          dropdownItems: const [
            "Class 1",
            "Class 2",
            "Class 3",
            "Class 4",
            "Class 5",
            "Class 6",
            "Class 7",
            "Class 8",
            "Class 9",
            "Class 10",
          ],
          selectedValue: index != null ? "Class ${index + 1}" : null,
        ),

        /// Book ID
        QmmaInputField(
          labelText: "Book ID",
          inputTEC: idTEC,
        ),
        const Gap(10),

        /// Book Name (Bengali)
        QmmaInputField(
          labelText: "কিতাবের নাম",
          inputTEC: bookNameBnTEC,
        ),
        const Gap(10),

        /// Book Name (Arabic)
        QmmaInputField(
          labelText: "اسم الكتاب",
          inputTEC: bookNameArTEC,
        ),
        const Gap(10),

        /// Book Name (English)
        QmmaInputField(
          labelText: "Book Name",
          inputTEC: bookNameEnTEC,
        ),
        const Gap(20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
          ),
          child: const Text("Save"),
        ),
      ]),
    ),
  );
}
