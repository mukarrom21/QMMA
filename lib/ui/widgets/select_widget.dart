import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget({
    super.key,
    this.onChangeSelectItem,
    this.dropdownItems,
    this.labelText,
    this.widgetWidth = 300,
    this.widgetHeight,
    this.border = false,
  });

  final double widgetWidth;
  final double? widgetHeight;
  final Function? onChangeSelectItem;
  final String? labelText;
  final List<String>? dropdownItems;
  final bool border;

  List<DropdownMenuItem<String>>? _getDropdownMenuItems() {
    return dropdownItems?.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double? selectWidgetHeight() {
      if (widgetHeight != null) {
        return widgetHeight;
      }
      return null;
    }

    InputBorder? inputBorder() {
      if(border){
        return const OutlineInputBorder();
      }
      return null;
    }

    return SizedBox(
      width: width > ScreenUtil.mobileMaxWidth ? widgetWidth : double.infinity,
      height: selectWidgetHeight(),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText ?? "",
          border: inputBorder(),
        ),
        items: _getDropdownMenuItems(),
        onChanged: (value) {
          if (onChangeSelectItem != null) {
            onChangeSelectItem!(value);
          }
        },
      ),
    );
  }
}