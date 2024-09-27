import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/widgets/input_field.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
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
              "Session",
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
                          "2024-25",
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
            InputField(
              width: 50,
              labelText: "Session Name Bengali",
              hintText: "Session Name Bengali",
              controller: _sessionTEC,
            ),
            const Gap(10),
            InputField(
              width: 50,
              labelText: "Session Name Arabic",
              hintText: "Session Name Arabic",
              controller: _sessionTEC,
            ),
            const Gap(10),
            InputField(
              width: 50,
              labelText: "Session Name English",
              hintText: "Session Name English",
              controller: _sessionTEC,
            ),
            const Gap(10),
            InputField(
              width: 50,
              labelText: " Session serial Number",
              hintText: "Session serial number",
              controller: _sessionTEC,
            ),
            const Gap(10),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
