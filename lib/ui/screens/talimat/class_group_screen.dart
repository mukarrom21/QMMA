import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/widgets/change_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/delete_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import '../../utils/qm_color.dart';
import '../../widgets/select_widget.dart';

class ClassGroupScreen extends StatefulWidget {
  const ClassGroupScreen({super.key});

  @override
  State<ClassGroupScreen> createState() => _ClassGroupScreenState();
}

class _ClassGroupScreenState extends State<ClassGroupScreen> {
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
          minWidth: 600,
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
        tooltip: "নতুন গ্রুপ যুক্ত করুন",
      ),
      iconTheme: const IconThemeData(color: QmColor.primary),
      backgroundColor: Colors.grey.shade200,
      elevation: 10,
      title: const Text(
        "গ্রুপ",
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
    );
  }

  /// Build DataTable2 Columns
  List<DataColumn2> _buildDataColumns() {
    return [
      DataColumn2(
        fixedWidth: 80,
        label: const Center(child: Text("সিরিয়াল")),
        onSort: (columnIndex, ascending) {
          // do something
        },
      ),
      DataColumn2(
        // fixedWidth: 150,
        label: const Center(child: Text("ক্লাশের নাম")),
        onSort: (columnIndex, ascending) {
          // do something
        },
      ),
      DataColumn2(
        // fixedWidth: 150,
        label: const Center(child: Text("গ্রুপের নাম")),
        onSort: (columnIndex, ascending) {
          // do something
        },
      ),
      DataColumn2(
        // fixedWidth: 100,
        label: const Center(child: Text("স্ট্যাটাস")),
        onSort: (columnIndex, ascending) {
          // do something
        },
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
          DataCell(Center(child: Text((index + 1).toString()))),
          DataCell(Center(child: Text("ক্লাশ ${index + 1}"))),
          DataCell(Center(child: Text("গ্রুপ ${index + 1}"))),
          const DataCell(Center(child: Text("Active"))),
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
        /// View Details
        PopupMenuItem(
          onTap: () {},
          value: 'সিরিয়াল পরিবর্তন করুন',
          child: const Row(
            children: [
              Icon(Icons.change_circle),
              SizedBox(
                width: 10,
              ),
              Text('সিরিয়াল পরিবর্তন করুন'),
            ],
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
          child: const Row(
            children: [
              Icon(Icons.edit),
              SizedBox(
                width: 10,
              ),
              Text('গ্রুপের নাম এডিট করুন'),
            ],
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
          child: const Row(
            children: [
              Icon(Icons.sync),
              SizedBox(
                width: 10,
              ),
              Text('স্ট্যাটাস পরিবর্তন করুন'),
            ],
          ),
        ),

        /// Delete
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => DeleteAlertDialog(
                title: 'ক্লাশ $index',
              ),
            );
          },
          value: 'delete',
          child: const Row(
            children: [
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text('ডিলিট করুন', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}

Widget _buildAddOrEditDialog(BuildContext context, [int? index]) {
  TextEditingController classNameBnTEC = TextEditingController(
    text: index == null ? null : "ক্লাশ ${index + 1}",
  );
  TextEditingController classNameArTEC = TextEditingController(
    text: index == null ? null : "الصف ${index + 1}",
  );
  TextEditingController classNameEnTEC = TextEditingController(
    text: index == null ? null : "Class ${index + 1}",
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
          index == null ? "নতুন গ্রুপ যোগ করুন" : "গ্রুপের নাম সংশোধন করুন",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        const Gap(20),

        /// ক্লাশ সিলেক্ট করুন
        const SelectWidget(
          labelText: "ক্লাশ সিলেক্ট করুন",
          dropdownItems: ["ক্লাশ 1", "ক্লাশ 2", "ক্লাশ 3"],
        ),
        const Gap(10),

        /// ক্লাশের নাম
        QmmaInputField(
          labelText: "গ্রুপের নাম",
          inputTEC: classNameBnTEC,
        ),
        const Gap(10),

        ///  اسم الصف
        QmmaInputField(
          labelText: "اسم المجموعة/الفرع",
          inputTEC: classNameArTEC,
        ),
        const Gap(10),

        /// Class Name
        QmmaInputField(
          labelText: "Group Name",
          inputTEC: classNameEnTEC,
        ),
        const Gap(10),
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
