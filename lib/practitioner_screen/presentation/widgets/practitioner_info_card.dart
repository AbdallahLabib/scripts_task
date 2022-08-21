import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/data/models/view_models/selection_model.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';
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
      padding: const EdgeInsets.all(8).r,
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
                      padding: EdgeInsets.only(right: 8.w),
                      child: id == 0
                          ? CircleAvatar(
                              radius: 14.r,
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
              CustomChipWidget(
                onTap: () => CalendarCubit.get(context).selectedPractitioner(
                  Selection(
                    id: id,
                    name: name,
                    imagePath: imagePath,
                  ),
                ),
                label: "Select",
              )
            ],
          ),

          //shifts
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "2 shifts: 9.00a - 1.00p  ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  width: 3.r,
                  height: 3.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "  5.00a - 7.00p",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),

          //office slots
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "20 office slots ",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                Text(
                  "on May 22",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),

          //next
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Next: ",
                style: Theme.of(context).textTheme.headline5,
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
