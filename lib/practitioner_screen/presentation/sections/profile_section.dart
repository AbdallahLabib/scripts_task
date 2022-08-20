import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class ProfileSection extends StatelessWidget {
  final int id;
  final String name;
  final String imagePath;

  const ProfileSection({
    Key? key,
    required this.id,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48.h,
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
                        child: id == 0
                            ? CircleAvatar(
                                radius: 16.r,
                                backgroundImage: AssetImage(imagePath),
                              )
                            : SvgPicture.asset(
                                imagePath,
                                width: 16.sp,
                                height: 16.sp,
                              ),
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
