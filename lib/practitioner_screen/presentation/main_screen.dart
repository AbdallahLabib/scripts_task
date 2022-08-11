import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/calendar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16, left: 28),
          child: Text(
            "Practitioner",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        //search bar
        const Padding(
          padding: EdgeInsets.only(left: 24, right: 86, bottom: 17),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for practitioners or specialties",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        //bottom section
        Row(
          children: [
            Container(
              width: 280,
              margin: const EdgeInsets.only(left: 24),
              child: Column(
                children: const [
                  //calendar
                  CalendarWidget(),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
