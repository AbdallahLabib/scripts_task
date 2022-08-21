import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/calendar_widget.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/location_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/practice_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/slider_widget.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/speciality_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/switch_widget.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/types_selections.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268.w,
      margin: EdgeInsets.only(left: 24.w),
      child: ListView(
        children: [
          //calendar
          const CalendarWidget(),

          //soonest availability
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Soonest availability",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                //switch
                const SwitchWidget(),
              ],
            ),
          ),
          //slider widget
          const SliderWidget(),

          //speciality
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              "Speciality ",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          //speciality options
          const SpecialitySelections(),

          //location
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              "Location ",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          //location options
          const LocationSelections(),

          //type
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              "Type",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          //type options
          const TypesSelections(),

          //practice
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Row(
              children: [
                Text(
                  "Practice ",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "1",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: AppPalette.inactiveColor),
                ),
              ],
            ),
          ),
          const PracticeSelections(),
          //show all
          Container(
            width: 268.w,
            height: 40.h,
            margin: EdgeInsets.symmetric(vertical: 7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppPalette.inactiveColor),
            ),
            child: CustomChipWidget(onTap: () {}, label: "Show All"),
          ),
        ],
      ),
    );
  }
}
