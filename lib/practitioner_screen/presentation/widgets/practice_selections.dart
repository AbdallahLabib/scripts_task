import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';

class PracticeSelections extends StatefulWidget {
  const PracticeSelections({Key? key}) : super(key: key);

  @override
  State<PracticeSelections> createState() => _PracticeSelectionsState();
}

class _PracticeSelectionsState extends State<PracticeSelections> {
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
          children: cubit.practice
              .map((e) => ChipWidgetWithImageAndMaxRowSize(
                    label: e.label,
                    iconPath: e.icon,
                    isMaxSize: true,
                    isSVG: false,
                    isSelected: e.id == cubit.selectedPracticeIndex,
                    onTap: () => cubit.changeToSelectedPractice(e.id),
                  ))
              .toList(),
        );
      },
    );
  }
}
