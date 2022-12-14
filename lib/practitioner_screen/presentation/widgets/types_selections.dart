import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/custom_chip_widget.dart';

class TypesSelections extends StatefulWidget {
  const TypesSelections({Key? key}) : super(key: key);

  @override
  State<TypesSelections> createState() => _TypesSelectionsState();
}

class _TypesSelectionsState extends State<TypesSelections> {
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
          children: cubit.types
              .map((e) => CustomChipWidget(
                    label: e.name,
                    iconPath: e.imagePath,
                    isSelected: e.id == cubit.selectedTypeIndex,
                    onTap: () => cubit.changeSelectedType(e.id),
                  ))
              .toList(),
        );
      },
    );
  }
}
