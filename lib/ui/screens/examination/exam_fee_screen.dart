import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/widgets/change_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/delete_alert_dialog.dart';
import 'package:qmma_flutter/ui/widgets/header_app_bar.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import 'package:qmma_flutter/ui/widgets/select_widget.dart';
import '../../utils/qm_color.dart';

/// Determination of examination fee
/// TODO: List of examination fee
/// This list contain session, class, exam name, fee.
/// TODO: Add or Edit Exam fee Dialog.
/// Select Session, Select Class, Select Exam Name, Select Fee.

class DefineExamFeeScreen extends StatefulWidget {
  const DefineExamFeeScreen({super.key});

  @override
  State<DefineExamFeeScreen> createState() => _DefineExamFeeScreenState();
}

class _DefineExamFeeScreenState extends State<DefineExamFeeScreen> {
  Offset _tapPosition = Offset.zero;
  List<int> selectedRows = [];
  final BorderSide _borderSide =
      const BorderSide(color: QmColor.primary, width: 1);

  List<String> columns = ["Session", "Exam Name", "Class", "Fee", "Status"];

  final TextEditingController _examFeeAmountTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        buildAddOrEditDialog: _buildAddOrEditDialog,
        title: "Exam Fees",
      ),
      body: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _tapPosition = details.globalPosition;
          });
        },
        child: DataTable2(
          minWidth: 1000,
          columnSpacing: 0,
          headingRowColor: const WidgetStatePropertyAll(
            QmColor.primary,
          ),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          border: TableBorder(
            horizontalInside: _borderSide,
            verticalInside: _borderSide,
            left: _borderSide,
            right: _borderSide,
            bottom: _borderSide,
          ),
          // columns: _buildDataColumns(),
          // rows: _buildDataRows(),
          columns: columns
              .map((e) => DataColumn2(label: Center(child: Text(e))))
              .toList(),
          rows: _buildDataRows(),
        ),
      ),
    );
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
          _onSecondaryTapShowPopupMenu(context, index);
        },
        onLongPress: () => _onSecondaryTapShowPopupMenu(context, index),
        cells: columns
            .map((e) => DataCell(Center(child: Text("$e ${index + 1}"))))
            .toList(),
        // [
        //   DataCell(Center(child: Text('${index + 1}'))),
        //   DataCell(Center(child: Text('Class ${index + 1}'))),
        //   DataCell(Center(child: Text('Book ${index + 1}'))),
        //   DataCell(Center(child: Text('Book ${index + 1}'))),
        //   DataCell(Center(child: Text('Book ${index + 1}'))),
        //   const DataCell(Center(child: Center(child: Text("Active")))),
        // ],
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
        /// Edit Name
        PopupMenuItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildAddOrEditDialog(context, index);
              },
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

  Widget _buildAddOrEditDialog(BuildContext context, [int? index]) {

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
            index == null ? "Add new Exam Fee" : "Edit Exam Fee",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Gap(20),

          /// Select Session
          SelectWidget(
            labelText: "Select Session",
            dropdownItems:
            List.generate(10, (index) => "Session ${index + 1}").toList(),
          ),
          const Gap(10),

          /// Select Class
          SelectWidget(
            labelText: "Select Class",
            dropdownItems: List.generate(10, (index) => "Class ${index + 1}").toList(),
          ),
          const Gap(10),

          /// Select Exam Name
          SelectWidget(
            labelText: "Select Exam Name",
            dropdownItems:
            List.generate(5, (index) => "Exam ${index + 1}").toList(),
          ),

          const Gap(10),
          /// Exam Fee Amount
          QmmaInputField(
            labelText: "Exam Fee Amount",
            inputTEC: _examFeeAmountTEC,
            keyboardType: TextInputType.number,
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

  @override
  void dispose() {
    super.dispose();
    selectedRows.clear();
    _examFeeAmountTEC.dispose();
  }
}


