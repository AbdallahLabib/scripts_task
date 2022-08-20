import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/create_appointment_header_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/create_appointment_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/practitioner_header_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/practitioners_grid_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/profile_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/settings_section.dart';
import 'package:scripts_task/responsive/responsive_layout.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class PractitionerScreen extends StatefulWidget {
  const PractitionerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PractitionerScreen> createState() => _PractitionerScreenState();
}

class _PractitionerScreenState extends State<PractitionerScreen> {
  final ScrollController _scrollController = ScrollController();

  late final SettingsCubit cubit;

  @override
  void initState() {
    cubit = SettingsCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final _size = MediaQuery.of(context).size;
        return cubit.selectedDrawerIconIndex != 1
            ? Expanded(
                child: Center(
                  child: Text(
                      cubit.drawerItemLabels[cubit.selectedDrawerIconIndex]),
                ),
              )
            : Expanded(
                child: Row(
                  children: [
                    //Create Appointment Header & Section
                    Visibility(
                      visible: cubit.isOpen,
                      child: SizedBox(
                        width: 392.w,
                        child: Column(
                          children: const [
                            CreateAppointmentHeaderSection(),
                            CreateAppointmentSection(),
                          ],
                        ),
                      ),
                    ),
                    //Create Appointment Vertical Divider
                    Visibility(
                      visible: cubit.isOpen,
                      child: VerticalDivider(
                        width: 1,
                        color: AppPalette.inactiveColor.withOpacity(0.4),
                      ),
                    ),

                    //Practitioner Header, Calendar Settings & Grid Sections
                    Expanded(
                      flex: 100,
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          //practitoner header section
                          const PractitionerHeaderSection(),

                          //bottom section
                          cubit.selectedAppointmentFilterIndex != 0
                              ? ProfileSection(
                                  id: 0,
                                  name: "name",
                                  imagePath: Assets.images.maleUser.path,
                                )
                              : SizedBox(
                                  height: 900.h,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //settings section
                                      const SettingsSection(),

                                      //vertical divider
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w),
                                        child: VerticalDivider(
                                          width: 1.w,
                                          color: AppPalette.inactiveColor
                                              .withOpacity(0.4),
                                        ),
                                      ),

                                      //doctors and nurses -- header & body
                                      Expanded(
                                        //flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 90.w),
                                          child: Column(
                                            children: [
                                              //header [# of practitiones + toggle button]
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 16.h),
                                                    child: Text(
                                                      "30 practitioners ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                  ),
                                                  //toggle button
                                                  //TODO:: toggle [Doctors - Nurses]
                                                ],
                                              ),

                                              //body --> GridView of practitioners
                                              ResponsiveLayout(
                                                mobile:
                                                    PractitionersGridSection(
                                                  crossAxisCount: 1,
                                                  childAspectRatio: 10.sp,
                                                ),
                                                tablet:
                                                    PractitionersGridSection(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 4.8.sp,
                                                ),
                                                desktop:
                                                    PractitionersGridSection(
                                                  crossAxisCount:
                                                      cubit.isOpen ? 2 : 3,
                                                  childAspectRatio: cubit.isOpen
                                                      ? 2.35
                                                      : 2.7.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
