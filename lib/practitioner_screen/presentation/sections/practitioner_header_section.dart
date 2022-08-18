import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

class PractitionerHeaderSection extends StatefulWidget {
  const PractitionerHeaderSection({Key? key}) : super(key: key);

  @override
  State<PractitionerHeaderSection> createState() =>
      _PractitionerHeaderSectionState();
}

class _PractitionerHeaderSectionState extends State<PractitionerHeaderSection> {
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16, left: 28),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => cubit.changeVisibility(),
                    borderRadius: BorderRadius.circular(10),
                    child: Transform.scale(
                      scale: 0.8,
                      child: Icon(
                        cubit.isOpen
                            ? CupertinoIcons.left_chevron
                            : CupertinoIcons.right_chevron,
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
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Practitioner",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            //search bar
            const Padding(
              padding: EdgeInsets.only(left: 24, right: 86, bottom: 17),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for practitioners or specialties",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
