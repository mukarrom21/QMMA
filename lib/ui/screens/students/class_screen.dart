import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/widgets/input_field.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import 'package:qmma_flutter/ui/widgets/select_widget.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final TextEditingController _sessionTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Class",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: Colors.teal.shade100,
                    // onTap: (){},
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      /// children
                      children: [
                        const Text(
                          "One",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3,
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text("Class Name (Bengali) :"),
                        ),
                        TableCell(
                          child: SizedBox(
                              width: 200,
                              child: QmmaInputField(
                                hintText: "Class Name (Bengali)",
                              )),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text("Class Name (Arabic) :"),
                        ),
                        TableCell(
                          child: SizedBox(
                            width: 200,
                            child: QmmaInputField(
                              hintText: "Class Name (Arabic)",
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text("Class Name (English) :"),
                        ),
                        TableCell(
                          child: QmmaInputField(
                            hintText: "Class Name (English)",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text("Save")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
