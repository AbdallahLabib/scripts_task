import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_filter_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_type_selections.dart';

class CreateAppointmentSection extends StatelessWidget {
  const CreateAppointmentSection({Key? key}) : super(key: key);

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
