import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scripts_task/shared/style/app_pallete.dart';

//I use Open-Closed Principle from [SOLID principles] to add
//new features without changing the old ones
abstract class ChipWidget extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  final String iconPath;
  final String label;
  final bool isMaxSize;
  final bool isSVG;

  const ChipWidget({
    Key? key,
    required this.onTap,
    required this.label,
    required this.isSelected,
    this.iconPath = "",
    this.isMaxSize = false,
    this.isSVG = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Badge(
        toAnimate: false,
        elevation: 0,
        shape: BadgeShape.square,
        padding: const EdgeInsets.all(7).r,
        badgeColor: isSelected ? AppPalette.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(9.r),
        borderSide: BorderSide(
          color: isSelected
              ? AppPalette.primaryColor
              : AppPalette.inactiveColor.withOpacity(0.2),
        ),
        badgeContent: iconPath.isEmpty
            ? Text(
                label,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color:
                          isSelected ? Colors.white : AppPalette.primaryColor,
                    ),
              )
            : Row(
                mainAxisSize: isMaxSize ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: isMaxSize
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceAround,
                children: [
                  //icon
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: isSVG
                        ? SvgPicture.asset(
                            iconPath,
                            color: isSelected
                                ? Colors.white
                                : AppPalette.primaryColor,
                          )
                        : CircleAvatar(
                            radius: 12.r,
                            backgroundImage: AssetImage(iconPath),
                          ),
                  ),
                  //label
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppPalette.primaryColor,
                        ),
                  ),
                ],
              ),
      ),
      /*    Chip(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected
                ? AppPalette.primaryColor
                : AppPalette.inactiveColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: isSelected ? AppPalette.primaryColor : Colors.white,
        labelPadding: const EdgeInsets.all(3),
        label: iconPath.isEmpty
            ? Text(
                label,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color:
                          isSelected ? Colors.white : AppPalette.primaryColor,
                    ),
              )
            : Row(
                mainAxisSize: isMaxSize ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: isMaxSize
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceAround,
                children: [
                  //icon
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: isSVG
                        ? SvgPicture.asset(
                            iconPath,
                            color: isSelected
                                ? Colors.white
                                : AppPalette.primaryColor,
                          )
                        : CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(iconPath),
                          ),
                  ),
                  //label
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppPalette.primaryColor,
                        ),
                  ),
                ],
              ),
      ),
     */
    );
  }
}

class ChipWidgetWithSVG extends ChipWidget {
  const ChipWidgetWithSVG({
    Key? key,
    required super.onTap,
    required super.isSelected,
    required super.label,
    super.iconPath,
  }) : super(key: key);
}

class ChipWidgetWithImageAndMaxRowSize extends ChipWidget {
  const ChipWidgetWithImageAndMaxRowSize({
    Key? key,
    required super.onTap,
    required super.isSelected,
    required super.label,
    super.iconPath,
    required super.isMaxSize,
    required super.isSVG,
  }) : super(key: key);
}
