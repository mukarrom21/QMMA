import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/screens/home_screen.dart';

class QmmaApp extends StatelessWidget {
  const QmmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QMMA',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),

        // Input Decoration Theme
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.purple),
          // ),
          // labelStyle: TextStyle(color: Colors.purple),
          floatingLabelStyle: TextStyle(color: Colors.purple),
          // fillColor: Colors.purple,
          // filled: true,
          errorStyle: TextStyle(color: Colors.red),
        ),

        // Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        )
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
