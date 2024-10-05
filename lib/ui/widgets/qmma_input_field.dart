import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';

class QmmaInputField extends StatelessWidget {
  const QmmaInputField({
    super.key,
    this.labelText,
    this.hintText,
    this.border = false,
    this.inputTEC,
    this.widgetWidth = 200,
    this.widgetHeight,
    this.keyboardType = TextInputType.text,
  });

  final String? labelText;
  final String? hintText;
  final bool? border;
  final TextEditingController? inputTEC;
  final double? widgetWidth;
  final double? widgetHeight;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        width:
            width > ScreenUtil.mobileMaxWidth ? widgetWidth : double.infinity,
        height: widgetHeight,
        child: TextFormField(
          controller: inputTEC,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            border: border! ? const OutlineInputBorder() : null,
          ),
        ));
  }
}
