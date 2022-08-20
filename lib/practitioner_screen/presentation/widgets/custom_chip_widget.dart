import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scripts_task/shared/style/app_pallete.dart';

//I use Open-Closed Principle from [SOLID principles] to add
//new features without changing the old ones
abstract class ChipWidget extends StatefulWidget {
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
    this.isSelected = false,
    this.iconPath = "",
    this.isMaxSize = false,
    this.isSVG = true,
  }) : super(key: key);

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      onHover: (value) => setState(() {
        isHovered = value;
      }),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.all(8).r,
        ),
        minimumSize: MaterialStateProperty.all<Size?>(const Size(32, 32)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(
              color: AppPalette.inactiveColor.withOpacity(0.2),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return AppPalette.primaryColor;
            }
            return widget.isSelected ? AppPalette.primaryColor : Colors.white;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white;
            }
            return widget.isSelected ? Colors.white : AppPalette.primaryColor;
          },
        ),
      ),
      child: widget.iconPath.isEmpty
          ? Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            )
          : Row(
              mainAxisSize:
                  widget.isMaxSize ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                  child: widget.isSVG
                      ? SvgPicture.asset(
                          widget.iconPath,
                          color: widget.isSelected || isHovered
                              ? Colors.white
                              : AppPalette.primaryColor,
                        )
                      : CircleAvatar(
                          radius: 12.r,
                          backgroundImage: AssetImage(widget.iconPath),
                        ),
                ),
                //label
                Text(
                  widget.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
    );
  }
}

class CustomChipWidget extends ChipWidget {
  const CustomChipWidget({
    Key? key,
    required super.onTap,
    required super.label,
    super.iconPath,
    super.isSelected,
    super.isMaxSize,
    super.isSVG,
  }) : super(key: key);
}
