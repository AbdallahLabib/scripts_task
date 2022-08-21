import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late final CalendarCubit cubit;

  @override
  void initState() {
    cubit = CalendarCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.h),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    side: BorderSide(
                      color: AppPalette.inactiveColor.withOpacity(0.2),
                    )),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
                  if (states.contains(MaterialState.hovered)) {
                    return AppPalette.inactiveColor.withOpacity(0.4);
                  }

                  return Colors.white;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
                  if (states.contains(MaterialState.hovered)) {
                    return AppPalette.primaryColor;
                  }
                  return Colors.white;
                },
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Image
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: cubit.appointmentFilters[0].imagePath
                                .contains("images")
                            ? CircleAvatar(
                                radius: 16.r,
                                backgroundImage: AssetImage(
                                    cubit.appointmentFilters[0].imagePath),
                              )
                            : SvgPicture.asset(
                                cubit.appointmentFilters[0].imagePath,
                                width: 16.sp,
                                height: 16.sp,
                              ),
                      ),
                      //Name & title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.appointmentFilters[0].name,
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
                Transform.scale(
                  scale: 0.8.sp,
                  child: const Icon(
                    CupertinoIcons.minus,
                    color: AppPalette.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
