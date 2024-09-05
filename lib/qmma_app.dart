import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/screens/home_screen.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';

class QmmaApp extends StatelessWidget {
  const QmmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QMMA',
      theme: ThemeData(
          // primarySwatch: QmColor.primary,
          appBarTheme: const AppBarTheme(
            backgroundColor: QmColor.primary,
            foregroundColor: Colors.white,
          ),

          // Input Decoration Theme
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.purple),
            // ),
            // labelStyle: TextStyle(color: Colors.purple),
            floatingLabelStyle: TextStyle(
              color: QmColor.primary,
            ),
            // fillColor: Colors.purple,
            // filled: true,
            errorStyle: TextStyle(
              color: Colors.red,
            ),
          ),

          // Elevated Button Theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: QmColor.primary,
              foregroundColor: Colors.white,
            ),
          )),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
