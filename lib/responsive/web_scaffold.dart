import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/screens/fixed_side_drawer.dart';
import 'package:scripts_task/practitioner_screen/presentation/screens/practitioner_screen.dart';

class WebScaffold extends StatelessWidget {
  const WebScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //Fixed side drawer
            FixedSideDrawer(),

            //Practitioner screen
            PractitionerScreen(),
          ],
        ),
      ),
    );
  }
}
