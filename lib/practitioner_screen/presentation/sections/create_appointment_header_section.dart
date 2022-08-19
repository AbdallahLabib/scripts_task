import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class CreateAppointmentHeaderSection extends StatefulWidget {
  const CreateAppointmentHeaderSection({Key? key}) : super(key: key);

  @override
  State<CreateAppointmentHeaderSection> createState() =>
      _CreateAppointmentHeaderSectionState();
}

class _CreateAppointmentHeaderSectionState
    extends State<CreateAppointmentHeaderSection> {
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
        return Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16, left: 24),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 33),
                child: Text(
                  "Create Appointment",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: AppPalette.primaryColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => cubit.changeVisibility(),
                borderRadius: BorderRadius.circular(10),
                child: Transform.scale(
                  scale: 0.8,
                  child: const Icon(
                    CupertinoIcons.left_chevron,
                    color: AppPalette.primaryColor,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: const Icon(
                  CupertinoIcons.minus,
                  color: AppPalette.primaryColor,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: const Icon(
                  CupertinoIcons.xmark,
                  color: AppPalette.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
