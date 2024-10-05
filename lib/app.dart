import 'package:flutter/material.dart';
import 'package:qmma_flutter/main_layout.dart';
import 'package:qmma_flutter/ui/utils/qm_color.dart';

class QmmaApp extends StatelessWidget {
  const QmmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QMMA',
      theme: ThemeData(
          colorSchemeSeed: QmColor.primary,
          appBarTheme: const AppBarTheme(
            backgroundColor: QmColor.primary,
            foregroundColor: Colors.white,
          ),

          /// Elevated Button Theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: QmColor.primary,
              foregroundColor: Colors.white,
            ),
          )),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
      // home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// !  Sidebar
              Container(
                width: 200,
                // height: double.infinity,
                color: Colors.yellow.shade200,
                child: const Column(
                  children: [
                    ListTile(
                      title: Text("Home"),
                    ),
                    ListTile(
                      title: Text("Home"),
                    ),
                    ListTile(
                      title: Text("Home"),
                    ),
                    ListTile(
                      title: Text("Home"),
                    ),
                  ],
                ),
              ),

              /// ! Body
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Home page")],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
