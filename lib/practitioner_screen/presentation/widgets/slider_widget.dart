import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late final CalendarCubit cubit;

  @override
  void initState() {
    cubit = CalendarCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 11.h),
                  child: Text(
                    "Time",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Text(
                  cubit.timeRange(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppPalette.primaryColor,
                inactiveTrackColor: AppPalette.inactiveColor,
                trackHeight: 0.5.h,
                thumbColor: Colors.white,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0.r),
                overlayColor: AppPalette.primaryColor,
                overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0.r),
              ),
              child: RangeSlider(
                values: cubit.range,
                divisions: 46,
                min: 0,
                max: 23,
                onChanged: (value) => cubit.onChanged(value),
              ),
            ),
          ],
        );
      },
    );
  }
}
