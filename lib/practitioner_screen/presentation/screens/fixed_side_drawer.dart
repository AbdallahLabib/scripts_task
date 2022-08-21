import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/fixed_drawer_item.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';

class FixedSideDrawer extends StatelessWidget {
  const FixedSideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.w,
      //height: 944.h,
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                //logo
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: Assets.icons.logo.svg(),
                ),

                //dashboard
                FixedDrawerItem(
                  id: 0,
                  label: 'Dashboard',
                  iconPath:
                      Assets.icons.dashboard.svg(width: 20.w, height: 20.h),
                ),

                //calendar
                FixedDrawerItem(
                  id: 1,
                  label: 'Calendar',
                  iconPath:
                      Assets.icons.calendar.svg(width: 20.w, height: 20.h),
                ),

                //clinical
                FixedDrawerItem(
                  id: 2,
                  label: 'Clinical',
                  iconPath:
                      Assets.icons.clinicalSvg.svg(width: 20.w, height: 20.h),
                ),

                //patients
                FixedDrawerItem(
                  id: 3,
                  label: 'Patients',
                  iconPath:
                      Assets.icons.patients.svg(width: 20.w, height: 20.h),
                ),

                //billing
                FixedDrawerItem(
                  id: 4,
                  label: 'Billing',
                  iconPath: Assets.icons.billing.svg(width: 20.w, height: 20.h),
                ),

                const Spacer(),

                //notifications
                FixedDrawerItem(
                  id: 5,
                  label: 'Notifications',
                  iconPath: Badge(
                    badgeContent: Text(
                      '34',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    padding: const EdgeInsets.all(4).r,
                    position: BadgePosition.topEnd(),
                    badgeColor: const Color(0xffEE6464),
                    child: Assets.icons.notifications
                        .svg(width: 20.w, height: 20.h),
                  ),
                ),

                //help
                FixedDrawerItem(
                  id: 6,
                  label: 'Help',
                  iconPath:
                      Assets.icons.notifications.svg(width: 20.w, height: 20.h),
                ),

                //user image
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h, top: 7.h),
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(Assets.images.femaleUser.path),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
