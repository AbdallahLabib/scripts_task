import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _focusDate = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffEFEEEE),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.chevron_left_rounded),
              ),
              Text(
                DateFormat("MMM yyyy").format(_focusDate),
                style: Theme.of(context).textTheme.headline1,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TableCalendar(
            focusedDay: _focusDate,
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2040),
            headerVisible: false,
            onFormatChanged: (result) {},
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return DateFormat("EE").format(date).toUpperCase();
              },
              weekdayStyle: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
              weekendStyle: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
