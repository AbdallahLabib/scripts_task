import 'package:flutter/material.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child:  Text("MOBILE"),
      ),
    );
  }
}