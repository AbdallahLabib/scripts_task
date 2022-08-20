import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          onTap: () => cubit.changeSelectedDrawerIconIndex(widget.id),
          child: cubit.selectedDrawerIconIndex == widget.id
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
                  margin: EdgeInsets.only(bottom: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      widget.iconPath,
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 7.h),
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
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Column(
                    children: [
                      widget.iconPath,
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 7.h),
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
