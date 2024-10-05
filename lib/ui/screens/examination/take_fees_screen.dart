import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';
import 'package:qmma_flutter/ui/widgets/header_app_bar.dart';
import 'package:qmma_flutter/ui/widgets/qmma_input_field.dart';
import 'package:qmma_flutter/ui/widgets/select_widget.dart';

///

class TakeFeesScreen extends StatefulWidget {
  const TakeFeesScreen({super.key});

  @override
  State<TakeFeesScreen> createState() => _TakeFeesScreenState();
}

class _TakeFeesScreenState extends State<TakeFeesScreen> {
  String feeType = "Monthly Fee";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Fees'),
        backgroundColor: QmColor.secondary,
      ),
      body: Container(
        constraints: const BoxConstraints(
          maxWidth: ScreenUtil.mobileMaxWidth * 0.8,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  /// Select Fee type
                  SelectWidget(
                    widgetWidth: ScreenUtil.mobileMaxWidth * 0.8,
                    border: true,
                    labelText: "Select Fee type",
                    dropdownItems: const [
                      "Monthly Fee",
                      "Admission Fee",
                      "Exam Fee",
                    ],
                    onChangeSelectItem: (value) {
                      setState(() {
                        feeType = value;
                      });
                    },
                  ),
                  const Gap(10),

                  if (feeType != "Admission Fee") SelectWidget(
                          widgetWidth: ScreenUtil.mobileMaxWidth * 0.8,
                          border: true,
                          labelText: feeType == "Monthly Fee"
                              ? "Select Month"
                              : "Select Exam Name",
                          dropdownItems: feeType == "Monthly Fee"
                              ? [
                                  "January",
                                  "February",
                                  "March",
                                  "April",
                                  "May",
                                  "June",
                                  "July",
                                  "August",
                                  "September",
                                  "October",
                                  "November",
                                  "December",
                                ]
                              : const [
                                  "Exam 1",
                                  "Exam 2",
                                  "Exam 3",
                                  "Exam 4",
                                ],
                          onChangeSelectItem: (value) {
                            setState(() {
                              feeType = value;
                            });
                          },
                        ) else const SizedBox(),
                  const Gap(20),
                  Text("Fee Type: $feeType"),
                  const Gap(10),
                  /// Search Student ID
                  const QmmaInputField(
                    labelText: "Student ID",
                    widgetWidth: ScreenUtil.mobileMaxWidth * 0.8,
                    border: true,
                    keyboardType: TextInputType.number,
                  ),
                  const Gap(10),
                  const Text("Name: Abdullah al Araf"),
                  const Gap(10),
                  const Text("Father Name: Abu Abdullah"),
                  const Gap(10),
                  const Text("Session: 2022-2023"),
                  const Gap(10),
                  const Text("Class: 1"),
                  const Gap(10),
                  const Text("Section: A"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
