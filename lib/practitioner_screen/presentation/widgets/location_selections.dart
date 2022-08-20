import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';

class LocationSelections extends StatefulWidget {
  const LocationSelections({Key? key}) : super(key: key);

  @override
  State<LocationSelections> createState() => _LocationSelectionsState();
}

class _LocationSelectionsState extends State<LocationSelections> {
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
        return Wrap(
          spacing: 5.w,
          runSpacing: 8.h,
          children: cubit.locations
              .map((e) => ChipWidgetWithSVG(
                    label: e.label,
                    iconPath: e.icon,
                    isSelected: e.id == cubit.selectedLocationIndex,
                    onTap: () => cubit.changeSelectedLocation(e.id),
                  ))
              .toList(),
        );
      },
    );
  }
}
