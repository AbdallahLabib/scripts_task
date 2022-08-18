import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';

class SpecialitySelections extends StatefulWidget {
  const SpecialitySelections({Key? key}) : super(key: key);

  @override
  State<SpecialitySelections> createState() => _SpecialitySelectionsState();
}

class _SpecialitySelectionsState extends State<SpecialitySelections> {
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
          spacing: 5,
          runSpacing: 10,
          children: cubit.labels
              .map((e) => ChipWidgetWithSVG(
                    label: e.label,
                    isSelected: e.id == cubit.selectedSpecialityIndex,
                    onTap: () => cubit.changeToSelectedSpeciality(e.id),
                  ))
              .toList(),
        );
      },
    );
  }
}
