import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class PractitionerHeaderSection extends StatefulWidget {
  const PractitionerHeaderSection({Key? key}) : super(key: key);

  @override
  State<PractitionerHeaderSection> createState() =>
      _PractitionerHeaderSectionState();
}

class _PractitionerHeaderSectionState extends State<PractitionerHeaderSection> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title & buttons
            Padding(
              padding: EdgeInsets.only(top: 32.h, bottom: 16.h, left: 28.w),
              child: Row(
                children: [
                  cubit.isOpen
                      ? Container()
                      : InkWell(
                          onTap: () => cubit.changeVisibility(),
                          borderRadius: BorderRadius.circular(10.r),
                          child: Transform.scale(
                            scale: 0.8.sp.sp,
                            child: const Icon(
                              CupertinoIcons.right_chevron,
                              color: AppPalette.primaryColor,
                            ),
                          ),
                        ),
                  cubit.isOpen
                      ? Container()
                      : Transform.scale(
                          scale: 0.8.sp,
                          child: const Icon(
                            CupertinoIcons.minus,
                            color: AppPalette.primaryColor,
                          ),
                        ),
                  cubit.isOpen
                      ? Container()
                      : Transform.scale(
                          scale: 0.8.sp,
                          child: const Icon(
                            CupertinoIcons.xmark,
                            color: AppPalette.primaryColor,
                          ),
                        ),
                  cubit.isOpen
                      ? Container()
                      : SizedBox(
                          width: 12.w,
                        ),
                  Text(
                    cubit
                        .appointmentFilter[cubit.selectedAppointmentFilterIndex]
                        .label,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            //search bar
            cubit.selectedAppointmentFilterIndex != 0
                ? Container()
                : Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 86.w, bottom: 16.h),
                    child: SizedBox(
                      height: 48.sp,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for practitioners or specialties",
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffAAAFC0)),
                          prefixIcon: Transform.scale(
                            scale: 0.8.sp,
                            child: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
