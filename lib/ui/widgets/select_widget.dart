import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({
    super.key,
    this.onChangeSelectItem,
    this.dropdownItems,
    this.labelText,
    this.widgetWidth = 200,
    this.widgetHeight,
    this.border = false,
    this.selectedValue,
  });

  final double widgetWidth;
  final double? widgetHeight;
  final Function? onChangeSelectItem;
  final String? labelText;
  final List<String>? dropdownItems;
  final bool border;
  final String? selectedValue;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  List<DropdownMenuItem<String>>? _getDropdownMenuItems() {
    return widget.dropdownItems?.map((String value) {
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
      if (widget.widgetHeight != null) {
        return widget.widgetHeight;
      }
      return null;
    }

    InputBorder? inputBorder() {
      if (widget.border) {
        return const OutlineInputBorder();
      }
      return null;
    }

    return SizedBox(
      width: width > ScreenUtil.mobileMaxWidth
          ? widget.widgetWidth
          : double.infinity,
      height: selectWidgetHeight(),
      child: DropdownButtonFormField<String>(
        value: widget.selectedValue,
        decoration: InputDecoration(
          labelText: widget.labelText ?? "",
          border: inputBorder(),
        ),
        selectedItemBuilder: (BuildContext context) {
          return _getDropdownMenuItems() ?? [];
        },
        items: _getDropdownMenuItems(),
        onChanged: (value) {
          if (widget.onChangeSelectItem != null) {
            widget.onChangeSelectItem!(value);
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        },
      ),
    );
  }
}
