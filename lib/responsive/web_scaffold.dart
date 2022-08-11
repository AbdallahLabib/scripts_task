import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/main_screen.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';

class WebScaffold extends StatelessWidget {
  const WebScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 56,
            color: Colors.black,
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    //logo
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Assets.icons.logo.svg(),
                    ),

                    //dashboard
                    Assets.icons.dashboard.svg(
                      width: 20,
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Dashboard',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    //calendar
                    Assets.icons.calendar.svg(
                      width: 20,
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Calendar',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    //clinical
                    Assets.icons.clinicalSvg.svg(
                      width: 20,
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Clinical',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    //patients
                    Assets.icons.patients.svg(
                      width: 20,
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Patients',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    //billing
                    Assets.icons.billing.svg(
                      width: 20,
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Billing',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    const Spacer(),

                    //notifications
                    Center(
                      child: Badge(
                        badgeContent: Text(
                          '34',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        padding: const EdgeInsets.all(4),
                        badgeColor: const Color(0xffEE6464),
                        child: Assets.icons.notifications.svg(
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Notifications',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    //help
                    Assets.icons.help.svg(
                      width: 20,
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 7),
                        child: Text(
                          'Help',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),

                    //user image
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(Assets.images.femaleUser.path),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: const MainScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
