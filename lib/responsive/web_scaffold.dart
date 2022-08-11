import 'package:flutter/material.dart';
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
            child: Column(
              children: [
                //logo
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 10),
                  child: Assets.icons.logo.svg(),
                ),

                //dashboard
                Assets.icons.dashboard.svg(),
                const Text('Dashboard', style: TextStyle(),)


              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
