import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/screens/fixed_side_drawer.dart';
import 'package:scripts_task/practitioner_screen/presentation/screens/practitioner_screen.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          //Fixed side drawer
          FixedSideDrawer(),

          //Practitioner screen
          PractitionerScreen(),
        ],
      ),
    );
  }
}
