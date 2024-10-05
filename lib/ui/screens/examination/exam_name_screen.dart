import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/widgets/change_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/delete_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/header_app_bar.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import '../../utils/qm_color.dart';

/// পরীক্ষার নাম: বাংলা, আরবী, ইংরেজি
/// TODO: Exam name Arabic,
/// TODO: Exam name English
/// TODO: Add new Exam name or Edit
/// TODO: Change Status
/// TODO: Delete Exam name

class ExamNameScreen extends StatefulWidget {
  const ExamNameScreen({super.key});

  @override
  State<ExamNameScreen> createState() => _ExamNameScreenState();
}

class _ExamNameScreenState extends State<ExamNameScreen> {
  Offset _tapPosition = Offset.zero;
  List<int> selectedRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderAppBar(
        title: 'পরীক্ষার নাম',
        buildAddOrEditDialog: _buildAddOrEditDialog,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildExamNames(),
      ),
    );
  }

  ListView _buildExamNames() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onSecondaryTapDown: (details) {
            setState(() {
              _tapPosition = details.globalPosition;
            });
            _onSecondaryTapShowPopupMenu(context, index);
          },
          onTapDown: (details) {
            setState(() {
              _tapPosition = details.globalPosition;
            });
          },
          onLongPress: () {
            _onSecondaryTapShowPopupMenu(context, index);
          },
          child: CheckboxListTile(
            tileColor: QmColor.secondary.withOpacity(0.3),
            // onTap: (){},
            title: Text(
              'Exam Name $index',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            value: true,
            onChanged: (bool? value) {},
            // checkboxSemanticLabel: 'Exam Name $index',
            /// take checkbox in first position
            controlAffinity: ListTileControlAffinity.leading,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Gap(10),
      itemCount: 4,
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
    text: index == null ? null : "Examination ${index + 1}",
  );
  TextEditingController bookNameArTEC = TextEditingController(
    text: index == null ? null : "Examination ${index + 1}",
  );
  TextEditingController bookNameEnTEC = TextEditingController(
    text: index == null ? null : "Examination ${index + 1}",
  );

  // return SimpleDialog(
  //   title: Text(
  //     index == null ? "Add New Exam" : "Edit Exam",
  //     style: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         children: [
  //           /// Exam Name (Bengali)
  //           QmmaInputField(
  //             labelText: "Exam Name (Bengali)",
  //             inputTEC: bookNameBnTEC,
  //           ),
  //           const Gap(10),
  //
  //           /// Exam Name (Arabic)
  //           QmmaInputField(
  //             labelText: "Exam Name (Arabic)",
  //             inputTEC: bookNameArTEC,
  //           ),
  //           const Gap(10),
  //
  //           /// Exam Name (English)
  //           QmmaInputField(
  //             labelText: "Exam Name (English)",
  //             inputTEC: bookNameEnTEC,
  //           ),
  //           // const Gap(20),
  //           // ElevatedButton(
  //           //   onPressed: () {
  //           //     Navigator.pop(context);
  //           //   },
  //           //   style: ElevatedButton.styleFrom(
  //           //     fixedSize: const Size.fromWidth(200),
  //           //   ),
  //           //   child: const Text("Save"),
  //           // ),
  //         ],
  //       ),
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Save'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ],
  // );

  return Dialog(
    child: Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        maxWidth: 300,
        // maxHeight: 600,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Title
          Text(
            index == null ? "Add new exam name" : "Edit exam name",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Gap(20),

          /// Book Name (Bengali)
          QmmaInputField(
            labelText: "Exam Name (Bengali)",
            inputTEC: bookNameBnTEC,
          ),
          const Gap(10),

          /// Book Name (Arabic)
          QmmaInputField(
            labelText: "Exam Name (Arabic)",
            inputTEC: bookNameArTEC,
          ),
          const Gap(10),

          /// Book Name (English)
          QmmaInputField(
            labelText: "Exam Name (English)",
            inputTEC: bookNameEnTEC,
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // style: ElevatedButton.styleFrom(
                //   fixedSize: const Size.fromWidth(double.maxFinite),
                // ),
                child: const Text("Save"),
              ),
              const Gap(10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Dialog(
// child: Container(
// padding: const EdgeInsets.all(20),
// constraints: const BoxConstraints(
// maxWidth: 300,
// // maxHeight: 600,
// ),
// child: Column(mainAxisSize: MainAxisSize.min, children: [
// /// Title
// Text(
// index == null ? "Add new exam name" : "Edit exam name",
// style: const TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// const Divider(),
// const Gap(20),
//
// /// Exam ID
// // QmmaInputField(
// //   labelText: "Book ID",
// //   inputTEC: idTEC,
// // ),
// // const Gap(10),
//
// /// Book Name (Bengali)
// QmmaInputField(
// labelText: "Exam Name (Bengali)",
// inputTEC: bookNameBnTEC,
// ),
// const Gap(10),
//
// /// Book Name (Arabic)
// QmmaInputField(
// labelText: "Exam Name (Arabic)",
// inputTEC: bookNameArTEC,
// ),
// const Gap(10),
//
// /// Book Name (English)
// QmmaInputField(
// labelText: "Exam Name (English)",
// inputTEC: bookNameEnTEC,
// ),
// const Gap(20),
// ElevatedButton(
// onPressed: () {
// Navigator.pop(context);
// },
// style: ElevatedButton.styleFrom(
// fixedSize: const Size.fromWidth(double.maxFinite),
// ),
// child: const Text("Save"),
// ),
// ]),
// ),
//
// )
