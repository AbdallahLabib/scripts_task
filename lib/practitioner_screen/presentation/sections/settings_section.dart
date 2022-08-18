import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/calendar_widget.dart';
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
      width: 268,
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //calendar
          const CalendarWidget(),

          //soonest availability
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
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
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              "Speciality ",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          //speciality options
          const SpecialitySelections(),

          //location
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              "Location ",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          //location options
          const LocationSelections(),

          //type
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              "Type",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          //type options
          const TypesSelections(),

          //practice
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
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
            width: 268,
            height: 32,
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppPalette.inactiveColor),
            ),
            child: InkWell(
              onTap: () {},
              hoverColor: AppPalette.primaryColor,
              borderRadius: BorderRadius.circular(9),
              child: Center(
                //TODO:: Hover color for text
                child: Text(
                  "Show All",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
