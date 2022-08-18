import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';

class FixedDrawerItem extends StatefulWidget {
  final int id;
  final String label;
  final Widget iconPath;

  const FixedDrawerItem({
    Key? key,
    required this.id,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  State<FixedDrawerItem> createState() => _FixedDrawerItemState();
}

class _FixedDrawerItemState extends State<FixedDrawerItem> {
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
        return InkWell(
          onTap: () => cubit.changeToSelectedDrawerIconIndex(widget.id),
          child: cubit.selectedDrawerIconIndex == widget.id
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      widget.iconPath,
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            widget.label,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      widget.iconPath,
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            widget.label,
                            style: Theme.of(context).textTheme.headline3,
                          ),
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
