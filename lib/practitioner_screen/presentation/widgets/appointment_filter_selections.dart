import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';
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
          children: List.generate(
            cubit.appointmentFilters.length,
            (index) {
              var item = cubit.appointmentFilters[index];
              return cubit.isPractitionerSelected && index == 0
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppPalette.inactiveColor.withOpacity(0.4)),
                          bottom: BorderSide(
                              color: AppPalette.inactiveColor.withOpacity(0.4)),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 11.h,
                          left: 24.w,
                          right: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Practitioner",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Transform.scale(
                                  scale: 0.8.sp,
                                  child: const Icon(
                                    CupertinoIcons.minus,
                                    color: AppPalette.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Image
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: item.imagePath.contains("images")
                                          ? CircleAvatar(
                                              radius: 16.r,
                                              backgroundImage:
                                                  AssetImage(item.imagePath),
                                            )
                                          : SvgPicture.asset(
                                              item.imagePath,
                                              width: 16.sp,
                                              height: 16.sp,
                                            ),
                                    ),
                                    //Name & title
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        Text(
                                          "General Practitioner",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                CustomChipWidget(
                                  onTap: () {},
                                  label: "Co-Visit",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () =>
                          cubit.changeSelectedAppointmentFilter(item.id),
                      child: Container(
                        height: 60.h,
                        color: item.id == cubit.selectedAppointmentFilterIndex
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
                                      item.name,
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
                              color: item.id ==
                                      cubit.selectedAppointmentFilterIndex
                                  ? AppPalette.primaryColor
                                  : Colors.white,
                              width: 1,
                            ),
                          ],
                        ),
                      ),
                    );
            },
            growable: false,
          ),
        );
      },
    );
  }
}
