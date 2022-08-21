import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_filter_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_type_selections.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class CreateAppointmentSection extends StatefulWidget {
  const CreateAppointmentSection({Key? key}) : super(key: key);

  @override
  State<CreateAppointmentSection> createState() =>
      _CreateAppointmentSectionState();
}

class _CreateAppointmentSectionState extends State<CreateAppointmentSection> {
  late final CalendarCubit cubit;

  @override
  void initState() {
    cubit = CalendarCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      height: 890.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                //Appointment Type Selections
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: const AppointmentTypeSelections(),
                ),

                SizedBox(
                  height: 32.h,
                ),

                //Appointment Filter Selections
                const AppointmentFilterSelections(),
              ],
            ),
          ),

          //Create Button
          SizedBox(
            height: 48.h,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(MaterialState.hovered)) {
                        return AppPalette.primaryColor;
                      }
                      return cubit.isPractitionerSelected
                          ? AppPalette.primaryColor
                          : Colors.white;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.white;
                      }
                      return cubit.isPractitionerSelected
                          ? Colors.white
                          : AppPalette.primaryColor;
                    },
                  ),
                ),
                child: Center(
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
