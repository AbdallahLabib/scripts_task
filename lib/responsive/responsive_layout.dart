import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return LayoutBuilder(builder: (context, constraints) {
    final _size = MediaQuery.of(context).size;

    if (_size.width < 945) {
      return mobile;
    } else if (_size.width < 1200) {
      return tablet;
    } else {
      return desktop;
    }
    //});
  }
}
