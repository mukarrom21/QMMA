import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.width, required this.labelText, required this.hintText, required this.controller,
  });

  final double width;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width > ScreenUtil.mobileMaxWidth ? 300 : double.infinity,
      child: TextFormField(
        decoration:  InputDecoration(
            border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
