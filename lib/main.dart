import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/cubit/practitioner/practitioner_cubit.dart';
import 'package:scripts_task/practitioner_screen/cubit/settings/settings_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsCubit()),
        BlocProvider(create: (_) => PractitionerCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scripts',
        theme: appTheme(),
        onGenerateRoute: appRouter.onGenerateRoute,
        home: const WebScaffold(),
      ),
    );
  }
}
