import 'package:flutter/material.dart';
import 'package:choco/screens/browser_page.dart';
import 'package:choco/screens/home_screen.dart';
import 'package:choco/screens/test_browser_page.dart';
import 'package:choco/screens/test_home.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      //enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Choco Browser',
      home: HomeScreen(),
    );
  }
}


