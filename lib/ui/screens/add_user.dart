import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';
import 'package:qmma_flutter/ui/widgets/date_picker.dart';
import 'package:qmma_flutter/ui/widgets/input_field.dart';
import 'package:qmma_flutter/ui/widgets/select_widget.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _fatherNameTEController = TextEditingController();
  final TextEditingController _motherNameTEController = TextEditingController();
  final TextEditingController _dobTEController = TextEditingController(
      // initial value
      // text: "Date of Birth",
      );
  final TextEditingController _birthCertificateNoTEController =
      TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();

  void _onTapSubmit() {
    print(_nameTEController.text);
  }

  String role = "Student";

  void _onChangeRole(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user info
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("User Information",
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    _buildUserInfoFormFields(width),

                    // address
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("Present Address",
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    _buildAddressFormFields(width),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("Permanent Address",
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    _buildAddressFormFields(width),

                    const SizedBox(height: 20),
                    // submit button
                    SizedBox(
                      width: width > ScreenUtil.mobileMaxWidth
                          ? double.infinity
                          : double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _onTapSubmit,
                        child: const Text("Submit"),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
           thickness: 20,
           height: 20,
           color: Colors.amber,
         ),
          Expanded(
            child: ListView.separated(
                // last to first
                // reverse: true,
                // last item will be on top and show scroll will start from top
                physics: const BouncingScrollPhysics(),

                itemBuilder: (context, index) {
                  return ListTile(
                    leading: OverflowBar(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    title: Text("Name"),
                    subtitle: Text("id: ${index + 1}"),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      height: 1,
                    ),
                itemCount: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoFormFields(double width) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        // Select User Role
        SelectWidget(
          border: true,
          onChangeSelectItem: _onChangeRole,
          labelText: "Select User Role",
          dropdownItems: const [
            "Student",
            "Staff",
            "Guardian",
          ],
        ),

        // Select User Role
        SelectWidget(
          border: true,
          onChangeSelectItem: _onChangeRole,
          labelText: "Select Gender",
          dropdownItems: const [
            "Male",
            "Female",
          ],
        ),

        // Full Name
        InputField(
          width: width,
          labelText: 'Full Name',
          hintText: "Enter full name",
          controller: _nameTEController,
        ),

        // Father Name
        InputField(
          width: width,
          labelText: "Father Name",
          hintText: "Enter father name",
          controller: _fatherNameTEController,
        ),

        // Mother Name
        InputField(
          width: width,
          labelText: "Mother Name",
          hintText: "Enter mother name",
          controller: _motherNameTEController,
        ),

        // Date of Birth
        DatePicker(
          width: width,
          dobTEController: _dobTEController,
        ),

        // Birth Certificate No
        InputField(
          width: width,
          labelText: "Birth Certificate No",
          hintText: "Enter birth certificate no",
          controller: _birthCertificateNoTEController,
        ),

        // Phone No
        InputField(
          width: width,
          labelText: "Phone No",
          hintText: "Enter phone no",
          controller: _phoneTEController,
        ),

        // Email
        InputField(
          width: width,
          labelText: "Email",
          hintText: "Enter email address",
          controller: _emailTEController,
        ),
      ],
    );
  }

  Widget _buildAddressFormFields(double width) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        // Select Village
        SelectWidget(
          border: true,
          onChangeSelectItem: _onChangeRole,
          labelText: "Select Village",
          dropdownItems: const [
            "Village 1",
            "Village 2",
            "Village 3",
            "Village 4",
            "Village 5",
          ],
        ),

        // Select Post Office
        SelectWidget(
          border: true,
          onChangeSelectItem: _onChangeRole,
          labelText: "Select Post Office",
          dropdownItems: const [
            "Post Office 1",
            "Post Office 2",
            "Post Office 3",
            "Post Office 4",
            "Post Office 5",
          ],
        ),

        // Select Police Station
        SelectWidget(
          border: true,
          onChangeSelectItem: _onChangeRole,
          labelText: "Select Police Station",
          dropdownItems: const [
            "Police Station 1",
            "Police Station 2",
            "Police Station 3",
            "Police Station 4",
            "Police Station 5",
          ],
        ),

        // Select District
        SelectWidget(
          border: true,
          onChangeSelectItem: _onChangeRole,
          labelText: "Select District",
          dropdownItems: const [
            "District 1",
            "District 2",
            "District 3",
            "District 4",
            "District 5",
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _fatherNameTEController.dispose();
    _motherNameTEController.dispose();
    _dobTEController.dispose();
    _birthCertificateNoTEController.dispose();
    _phoneTEController.dispose();
    _emailTEController.dispose();
    super.dispose();
  }
}
