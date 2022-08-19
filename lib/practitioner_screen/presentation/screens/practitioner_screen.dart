import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/create_appointment_header_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/create_appointment_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/practitioner_header_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/practitioners_grid_section.dart';
import 'package:scripts_task/practitioner_screen/presentation/sections/settings_section.dart';
import 'package:scripts_task/responsive/responsive_layout.dart';
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
                child: SizedBox(
                  height: 944,
                  child: Row(
                    children: [
                      //Create Appointment Header & Section
                      Visibility(
                        visible: cubit.isOpen,
                        child: Expanded(
                          flex: 39,
                          child: ListView(
                            children: const [
                              CreateAppointmentHeaderSection(),
                              CreateAppointmentSection(),
                            ],
                          ),
                        ),
                      ),
                      
                      Visibility(
                        visible: cubit.isOpen,
                        child: VerticalDivider(
                          width: 1,
                          color: AppPalette.inactiveColor.withOpacity(0.4),
                        ),
                      ),

                      
                      Expanded(
                        flex: 100,
                        child: ListView(
                          controller: _scrollController,
                          children: [
                            //practitoner header section
                            const PractitionerHeaderSection(),

                            //bottom section
                            SizedBox(
                              height: 850,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //settings section
                                  const SettingsSection(),

                                  //vertical divider
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: VerticalDivider(
                                      width: 1,
                                      color: AppPalette.inactiveColor
                                          .withOpacity(0.4),
                                    ),
                                  ),

                                  //doctors and nurses -- header & body
                                  Expanded(
                                    //flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 90),
                                      child: Column(
                                        children: [
                                          //header [# of practitiones + toggle button]
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16),
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
                                            mobile: PractitionersGridSection(
                                              crossAxisCount: 1,
                                              childAspectRatio:
                                                  _size.width < 945 ? 3.8 : 1,
                                            ),
                                            tablet: PractitionersGridSection(
                                              crossAxisCount: 2,
                                              childAspectRatio: _size.width <
                                                      900
                                                  ? 1.75
                                                  : _size.width < 920
                                                      ? 1.9
                                                      : _size.width < 940
                                                          ? 2.0
                                                          : _size.width < 975
                                                              ? 2.1
                                                              : _size.width <
                                                                      1005
                                                                  ? 2.25
                                                                  : _size.width <=
                                                                          1045
                                                                      ? 2.4
                                                                      : _size.width <
                                                                              1090
                                                                          ? 2.6
                                                                          : _size.width < 1130
                                                                              ? 2.8
                                                                              : 3,
                                            ),
                                            desktop: PractitionersGridSection(
                                              crossAxisCount:
                                                  cubit.isOpen ? 2 : 3,
                                              childAspectRatio:
                                                  _size.width < 1240
                                                      ? 2.2
                                                      : _size.width < 1295
                                                          ? 2.3
                                                          : _size.width < 1390
                                                              ? 2.5
                                                              : 2.8,
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
                ),
              );
      },
    );
  }
}
