import 'package:flutter/material.dart';
import 'package:scripts_task/responsive/mobile_scaffold.dart';
import 'package:scripts_task/responsive/responsive_layout.dart';
import 'package:scripts_task/responsive/tablet_scaffold.dart';
import 'package:scripts_task/responsive/web_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        webScaffold: WebScaffold(),
      ),
    );
  }
}
