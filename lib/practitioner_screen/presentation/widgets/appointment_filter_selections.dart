import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class AppointmentFilterSelections extends StatefulWidget {
  const AppointmentFilterSelections({Key? key}) : super(key: key);

  @override
  State<AppointmentFilterSelections> createState() =>
      _AppointmentFilterSelectionsState();
}

class _AppointmentFilterSelectionsState
    extends State<AppointmentFilterSelections> {
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
            children: cubit.appointmentFilter
                .map((e) => InkWell(
                      onTap: () => cubit.changeSelectedAppointmentFilter(e.id),
                      child: Container(
                        height: 56.h,
                        color: e.id == cubit.selectedAppointmentFilterIndex
                            ? AppPalette.inactiveColor.withOpacity(0.2)
                            : Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.label,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    Transform.scale(
                                      scale: 0.8.sp,
                                      child: const Icon(
                                        Icons.add,
                                        color: AppPalette.primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color:
                                  e.id == cubit.selectedAppointmentFilterIndex
                                      ? AppPalette.primaryColor
                                      : Colors.white,
                              width: 1,
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList());
      },
    );
  }
}
