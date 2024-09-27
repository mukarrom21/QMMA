import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.width, required this.dobTEController});

  final double width;
  final TextEditingController dobTEController;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width > ScreenUtil.mobileMaxWidth ? 300 : double.infinity,
      decoration: BoxDecoration(
        // border
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.symmetric(horizontal: 40),
        leading: const Text(
          "Date of Birth:",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        title: Text(widget.dobTEController.text),
        // subtitle: const Text("Date of Birth"),
        trailing: const Icon(Icons.calendar_month),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            setState(() {
              widget.dobTEController.text =
                  DateFormat('dd-MMM-yyyy').format(pickedDate);
            });
          }
        },
      ),
    );
  }
}
