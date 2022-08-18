import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late final SettingsCubit cubit;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;      

  @override
  void initState() {
    _selectedDay = _focusedDay;
    cubit = SettingsCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffEFEEEE),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => cubit.monthToLeft(),
                      child: Transform.scale(
                        scale: 0.7,
                        child: const Icon(CupertinoIcons.left_chevron),
                      ),
                    ),
                    Text(
                      DateFormat("MMM yyyy").format(cubit.focusedDay),
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: AppPalette.primaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () => cubit.monthToRight(),
                      child: Transform.scale(
                        scale: 0.7,
                        child: const Icon(CupertinoIcons.right_chevron),
                      ),
                    ),
                  ],
                ),
              ),
              //TODO:
              //1. cubit not working !!
              //2. remove circle shape when de-select day
              Expanded(
                child: TableCalendar(
                  shouldFillViewport: true,
                  focusedDay: cubit.focusedDay,
                  firstDay: DateTime.utc(2010),
                  lastDay: DateTime.utc(2040),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  headerVisible: false,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (date, locale) {
                      return DateFormat("E").format(date).toUpperCase();
                    },
                    weekdayStyle: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
                    weekendStyle: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  calendarStyle: const CalendarStyle(
                    todayTextStyle: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    todayDecoration: BoxDecoration(
                      color: AppPalette.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppPalette.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}