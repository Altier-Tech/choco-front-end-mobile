import 'package:flutter/material.dart';
import 'package:choco/screens/home_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  var devicePre = false;

  if (devicePre) {
    runApp(DevicePreview(
      //enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Choco',
      home: HomeScreen(),
    );
  }
}
