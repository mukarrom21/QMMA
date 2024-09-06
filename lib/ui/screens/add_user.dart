import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';
import 'package:qmma_flutter/ui/widgets/input_field.dart';
import 'package:qmma_flutter/ui/widgets/select_widget.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: [
          // Select User Role
          SelectWidget(width: width),
          InputField(
            width: width,
            labelText: 'Full Name',
            hintText: "Enter full name",
            controller: _nameTEController,
          ),
          
          // submit button
          ElevatedButton(onPressed: (){}, child: Text("Submit"))
        ],
      ),
    );
  }
}

/*
Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: width < ScreenUtil.mobileMaxWidth
                ? 1
                : width < ScreenUtil.tabletMaxWidth
                    ? 2
                    : 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5 / 1.1,
          ),
          children: [
            // user role dropdown button
            DropdownButtonFormField<String>(
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
                DropdownMenuItem(
                  value: 'Staff',
                  child: Text('Staff'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) {
                // Do something when the dropdown value is changed
                print(value);
              },
            ),

            // name input text field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter Full Name Bangla',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            // Gender dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Gender',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
              ],
              onChanged: (value) {
                // Do something when the dropdown value is changed
                print(value);
              },
            ),

            // Date of Birth
            ListTile(
              title: const TextField(),
              subtitle: Text(_dateOfBirth.text),
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
                    _dateOfBirth.text =
                        DateFormat('dd-MMM-yyyy').format(pickedDate);
                  });
                }
              },
            ),

            // date picker
            Container(
              // set height like TextFiled
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: _dateOfBirth,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateOfBirth.text =
                          DateFormat('dd-MMM-yyyy').format(pickedDate);
                    });
                  }
                },
              ),
            ),

            // Date Certificate
            TextFormField(
              // set type is number
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Date of Certificate',
                hintText: 'Enter Date of Certificate',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || int.parse(value) < 0) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            // Father Name
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Father Name',
                hintText: 'Enter Father Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            // Mother Name
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mother Name',
                hintText: 'Enter Mother Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            // mobile number
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                hintText: 'Enter Mobile Number',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            // email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  */
