import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/next_shift_container.dart';

class PractitionerInfoCard extends StatelessWidget {
  final int id;
  final String name;
  final String imagePath;

  const PractitionerInfoCard({
    Key? key,
    required this.id,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffEFEEEE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Image, Name, title & Select Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Image, Name & title
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Image
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: id == 0
                          ? CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(imagePath),
                            )
                          : SvgPicture.asset(imagePath),
                    ),
                    //Name & title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          "General Practitioner",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Select button
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffEFEEEE),
                    ),
                  ),
                  child: Text(
                    "Select",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),

          //shifts
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "2 shifts: 9.00a - 1.00p  ",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "  5.00a - 7.00p",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),

          //office slots
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "20 office slots ",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                Text(
                  "on May 22",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),

          const Spacer(),

          //next
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Next: ",
                style: Theme.of(context).textTheme.headline4,
              ),
              const NextShiftContainer(title: "9:30a"),
              const NextShiftContainer(title: "2:00p"),
              const NextShiftContainer(title: "2:30p"),
              const NextShiftContainer(title: "3:30p"),
              const NextShiftContainer(title: "4:30p"),
            ],
          )
        ],
      ),
    );
  }
}
