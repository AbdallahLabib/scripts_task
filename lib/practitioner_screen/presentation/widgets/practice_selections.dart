import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class PracticeSelections extends StatefulWidget {
  const PracticeSelections({Key? key}) : super(key: key);

  @override
  State<PracticeSelections> createState() => _PracticeSelectionsState();
}

class _PracticeSelectionsState extends State<PracticeSelections> {
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
          children: cubit.practice
              .map((e) => SizedBox(
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () => cubit.changeSelectedPractice(e.id),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                          EdgeInsets.zero,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (states) {
                            return e.id == cubit.selectedPracticeIndex
                                ? AppPalette.primaryColor
                                : Colors.white;
                          },
                        ),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (states) {
                            return e.id == cubit.selectedPracticeIndex
                                ? Colors.white
                                : AppPalette.primaryColor;
                          },
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //icon
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundImage: AssetImage(e.icon),
                            ),
                          ),
                          //label
                          Text(
                            e.label,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
