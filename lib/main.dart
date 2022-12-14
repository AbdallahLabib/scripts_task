import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/responsive/web_scaffold.dart';
import 'package:scripts_task/shared/general/bloc_observer.dart';
import 'package:scripts_task/shared/general/routes.dart';
import 'package:scripts_task/shared/style/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Dependency Injection
  await di.initn();

  //EasyLocalization
  await EasyLocalization.ensureInitialized();

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
    return ScreenUtilInit(
      designSize: const Size(1440, 994),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CalendarCubit()),
          ],
          child: EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              //Locale('ar'),
            ],
            useOnlyLangCode: true,
            path: 'assets/lang',
            fallbackLocale: const Locale('en'),
            child: Builder(builder: (context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Scripts',
                theme: appTheme(),
                home: const WebScaffold(),
                onGenerateRoute: appRouter.onGenerateRoute,
                builder: (context, child) {
                  return child!;
                },
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: [
                  FormBuilderLocalizations.delegate,
                  ...context.localizationDelegates,
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
