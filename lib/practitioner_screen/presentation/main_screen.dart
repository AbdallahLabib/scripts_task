import 'package:flutter/material.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';

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
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
