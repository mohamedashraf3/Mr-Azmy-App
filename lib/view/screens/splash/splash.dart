import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view/screens/home/home.dart';
import 'package:mr_azmi/view_model/utils/connection_alert.dart';

import '../../../view_model/data/local/shared_prefrence/shared_keys.dart';
import '../../../view_model/data/local/shared_prefrence/shared_prefrence.dart';
import '../../../view_model/utils/imgs.dart';
import '../login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Images.splashPhoto,
      nextScreen:Builder(
        builder: (context) {
          ConnectionAlert.checkConnectivity(context);
          if (LocalData.get(SharedKeys.isLogin) ?? false) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        }) ,
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 300,
    );
  }
}
