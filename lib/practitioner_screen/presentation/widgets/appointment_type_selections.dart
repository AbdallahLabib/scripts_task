import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';

class AppointmentTypeSelections extends StatefulWidget {
  const AppointmentTypeSelections({Key? key}) : super(key: key);

  @override
  State<AppointmentTypeSelections> createState() =>
      _AppointmentTypeSelectionsState();
}

class _AppointmentTypeSelectionsState extends State<AppointmentTypeSelections> {
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
        return Wrap(
          spacing: 5.w,
          runSpacing: 8.h,
          children: cubit.appointmentType
              .map((e) => CustomChipWidget(
                    label: e.label,
                    isSelected: e.id == cubit.selectedAppointmentTypeIndex,
                    onTap: () => cubit.changeSelectedAppointmentType(e.id),
                  ))
              .toList(),
        );
      },
    );
  }
}
