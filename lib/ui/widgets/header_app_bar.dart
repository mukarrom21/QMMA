import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import 'package:gap/gap.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({
    super.key,
    required this.buildAddOrEditDialog,
    required this.title,
  });

  final String title;
  final Function buildAddOrEditDialog;

  _onPressedShowDialog(context) {
    showDialog(
      context: context,
      builder: (context) => buildAddOrEditDialog(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: QmColor.primary),
      backgroundColor: Colors.grey.shade200,
      title: Text(
        title,
        style: const TextStyle(
          color: QmColor.dark,
          fontWeight: FontWeight.w800,
        ),
      ),
      // centerTitle: true,
      actions: [
        /// TextButton with icon
        TextButton.icon(
          label: Text("$title নতুন যোগ করুন"),
          icon: const Icon(Icons.add),
          onPressed: () => _onPressedShowDialog(context),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(QmColor.secondary),
            foregroundColor: WidgetStatePropertyAll(QmColor.light),
          ),
        ),
        Tooltip(
          message: "সেটিংস",
          preferBelow: false,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: QmColor.primary,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAddOrEditDialog(BuildContext context, [int? index]) {
    TextEditingController idTEC = TextEditingController(
      text: index == null ? null : "${index + 1}",
    );
    TextEditingController bookNameBnTEC = TextEditingController(
      text: index == null ? null : "Book ${index + 1}",
    );
    TextEditingController bookNameArTEC = TextEditingController(
      text: index == null ? null : "Book ${index + 1}",
    );
    TextEditingController bookNameEnTEC = TextEditingController(
      text: index == null ? null : "Book ${index + 1}",
    );

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
            index == null ? "নতুন কিতাব যোগ করুন" : "কিতাবের নাম সংশোধন করুন",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Gap(20),

          /// Book ID
          QmmaInputField(
            labelText: "Book ID",
            inputTEC: idTEC,
          ),
          const Gap(10),

          /// Book Name (Bengali)
          QmmaInputField(
            labelText: "কিতাবের নাম",
            inputTEC: bookNameBnTEC,
          ),
          const Gap(10),

          /// Book Name (Arabic)
          QmmaInputField(
            labelText: "اسم الكتاب",
            inputTEC: bookNameArTEC,
          ),
          const Gap(10),

          /// Book Name (English)
          QmmaInputField(
            labelText: "Book Name",
            inputTEC: bookNameEnTEC,
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
}
