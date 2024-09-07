import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';


class SelectWidget extends StatelessWidget {
  const SelectWidget({
    super.key,
    required this.width, required this.onChangeRole,
  });

  final double width;
  final Function onChangeRole;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width > ScreenUtil.mobileMaxWidth ? 300 : double.infinity,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'User Role',
        ),
        items: const [
          DropdownMenuItem(
            value: 'Admin',
            child: Text('Admin'),
          ),
          DropdownMenuItem(
            value: 'Teacher',
            child: Text('Teacher'),
          ),
          DropdownMenuItem(
            value: 'Student',
            child: Text('Student'),
          ),
          DropdownMenuItem(
            value: 'Parent',
            child: Text('Parent'),
          ),
        ],
        onChanged: (value) {
          onChangeRole(value);
          // Do something when the dropdown value is changed
        },
      ),
    );
  }
}
