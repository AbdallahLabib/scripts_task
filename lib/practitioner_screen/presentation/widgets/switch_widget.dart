import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
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
        return SizedBox(
          width: 30.sp,
          height: 20.sp,
          child: FittedBox(
            fit: BoxFit.fill,
            child: CupertinoSwitch(
              value: cubit.swithcValue,
              activeColor: AppPalette.primaryColor,
              onChanged: (value) => cubit.changeSwitchValue(value),
            ),
          ),
        );
      },
    );
  }
}
