import 'package:flutter/material.dart';
import 'package:qmma_flutter/data/model/nav_item_model.dart';
import 'package:qmma_flutter/ui/screens/accounting/expense.dart';
import 'package:qmma_flutter/ui/screens/accounting/income.dart';
import 'package:qmma_flutter/ui/screens/accounting/income_expense.dart';
import 'package:qmma_flutter/ui/screens/dashboard/dashboard.dart';
import 'package:qmma_flutter/ui/screens/examination/admit_card_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/due_fees_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/exam_fee_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/exam_name_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/fees_report_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/paid_fees_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/result_entry_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/result_settings_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/results_screen.dart';
import 'package:qmma_flutter/ui/screens/examination/take_fees_screen.dart';
import 'package:qmma_flutter/ui/screens/talimat/book_screen.dart';
import 'package:qmma_flutter/ui/screens/talimat/class_group_screen.dart';
import 'package:qmma_flutter/ui/screens/talimat/class_screen.dart';
import 'package:qmma_flutter/ui/screens/talimat/session_screen.dart';
import 'package:qmma_flutter/ui/screens/students/students_screen.dart';
import 'package:qmma_flutter/ui/screens/users/users.dart';

final List<NavItemModel> navItemDataList = [
  NavItemModel(
    name: "ড্যাশবোর্ড",
    path: "dashboard",
    icon: Icons.dashboard,
    screen: const Dashboard(),
  ),
  NavItemModel(
    name: "ইউজার",
    icon: Icons.person,
    path: "users",
    screen: const Users(),
  ),
  NavItemModel(
    name: "শিক্ষার্থী",
    icon: Icons.school,
    path: "students",
    screen: const StudentsScreen(),
  ),
  NavItemModel(
    name: "তা’লিমাত",
    icon: Icons.home_work_rounded,
    path: null,
    children: _talimatNavItems,
  ),
  NavItemModel(
    name: "পরীক্ষা",
    icon: Icons.book_outlined,
    path: null,
    children: _examNavItems,
  ),
  NavItemModel(
    name: "আয় ব্যায়",
    icon: Icons.account_balance_rounded,
    path: null,
    children: _accountingNavItems,
  ),
];

final List<NavItemModel> _talimatNavItems = [
  NavItemModel(
    name: "শিক্ষাবর্ষ",
    icon: Icons.calendar_month,
    path: "academic_year",
    screen: const SessionScreen(),
  ),
  NavItemModel(
    name: "ক্লাশ",
    icon: Icons.school_outlined,
    path: "class",
    screen: const ClassScreen(),
  ),
  NavItemModel(
    name: "গ্রুপ",
    icon: Icons.groups_rounded,
    path: "class_group",
    screen: const ClassGroupScreen(),
  ),
  NavItemModel(
    name: "কিতাব",
    icon: Icons.menu_book_outlined,
    path: "book",
    screen: const BookScreen(),
  ),
];

final List<NavItemModel> _examNavItems = [
  /// Exam Name
  NavItemModel(
    name: "Exam Name",
    icon: Icons.book_outlined,
    path: "exam_name",
    screen: const ExamNameScreen(),
  ),

  /// Define Exam Fees
  NavItemModel(
    name: "Define Exam Fees",
    icon: Icons.edit_note,
    path: "define_exam_fee",
    screen: const DefineExamFeeScreen(),
  ),

  /// Take Fees
  NavItemModel(
    name: "Take Fees",
    icon: Icons.book_outlined,
    path: "take_fee",
    screen: const TakeFeesScreen(),
  ),

  /// paid fees
  NavItemModel(
    name: "Paid Fees",
    icon: Icons.book_outlined,
    path: "paid_fee",
    screen: const PaidFeesScreen(),
  ),

  /// Due Fees
  NavItemModel(
    name: "Due Fees",
    icon: Icons.book_outlined,
    path: "due_fee",
    screen: const DueFeesScreen(),
  ),

  /// Fees Report
  NavItemModel(
    name: "Fees Report",
    icon: Icons.book_outlined,
    path: "fees_report",
    screen: const FeesReportScreen(),
  ),

  /// Exam Admit Card
  NavItemModel(
    name: "Admit Card",
    icon: Icons.book_outlined,
    path: "admit_card",
    screen: const AdmitCardScreen(),
  ),

  /// Result Entry
  NavItemModel(
    name: "Result Entry",
    icon: Icons.book_outlined,
    path: "result_entry",
    screen: const ResultEntryScreen(),
  ),

  /// Result Settings
  NavItemModel(
    name: "Result Settings",
    icon: Icons.book_outlined,
    path: "result_settings",
    screen: const ResultSettingsScreen(),
  ),

  /// Exam Result
  NavItemModel(
    name: "Exam Result",
    icon: Icons.book_outlined,
    path: "exam_result",
    screen: const ResultsScreen(),
  ),
];

final List<NavItemModel> _accountingNavItems = [
  NavItemModel(
    name: "জমা খরচ",
    path: "income_expense",
    icon: Icons.currency_exchange_rounded,
    screen: const IncomeExpense(),
  ),
  NavItemModel(
    name: "জমা",
    path: "income",
    icon: Icons.attach_money_rounded,
    screen: const Income(),
  ),
  NavItemModel(
    name: "খরচ",
    path: "expense",
    icon: Icons.shopping_bag_outlined,
    screen: const Expense(),
  ),
];
