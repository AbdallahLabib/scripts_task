import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/responsive/mobile_scaffold.dart';
import 'package:scripts_task/responsive/responsive_layout.dart';
import 'package:scripts_task/responsive/tablet_scaffold.dart';
import 'package:scripts_task/responsive/web_scaffold.dart';
import 'package:scripts_task/shared/general/bloc_observer.dart';
import 'package:scripts_task/shared/general/routes.dart';
import 'package:scripts_task/shared/style/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(appRouter: AppRouter()));

  runZonedGuarded(() {
    Bloc.observer = AppBlocObserver();
  }, (error, stackTrace) {
    //log(error.toString(), stackTrace: stackTrace);
    //FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scripts',
      theme: appTheme(),
      onGenerateRoute: appRouter.onGenerateRoute,
      home: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        webScaffold: WebScaffold(),
      ),
    );
  }
}
