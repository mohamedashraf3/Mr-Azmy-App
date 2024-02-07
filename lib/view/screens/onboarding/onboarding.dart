import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:mr_azmi/view/screens/login/login.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_prefrence.dart';
import 'package:mr_azmi/view_model/utils/imgs.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';

import '../../../view_model/utils/app_colors.dart';
import '../../../view_model/utils/connection_alert.dart';
import '../../components/customs/text_custom.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectionAlert.checkConnectivity(context);
    return IntroductionSlider(
      showStatusBar: true,
      scrollDirection: Axis.vertical,
      items: [
        IntroductionSliderItem(
          logo: Image.asset(Images.onBoarding1),
          title: TextCustom(
            text: LocaleKeys.onBoarding1Title.tr(),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextCustom(
              text: LocaleKeys.onBoarding1SubTitle.tr(),
              fontSize: 18,
            ),
          ),
          gradient: LinearGradient(
            colors: [AppColors.orange, AppColors.darkPink],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
        IntroductionSliderItem(
          logo: Image.asset(Images.onBoarding2),
          title: TextCustom(
            text: LocaleKeys.onBoarding2Title.tr(),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextCustom(
              text: LocaleKeys.onBoarding2SubTitle.tr(),
              fontSize: 18,
            ),
          ),
          gradient: LinearGradient(
            colors: [AppColors.orange, AppColors.darkPink],
            begin: Alignment.bottomRight,
            end: Alignment.center,
          ),
        ),
        IntroductionSliderItem(
          logo: Image.asset(Images.onBoarding3),
          title: TextCustom(
            text: LocaleKeys.onBoarding3Title.tr(),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextCustom(
              text: LocaleKeys.onBoarding3SubTitle.tr(),
              fontSize: 18,
            ),
          ),
          gradient: LinearGradient(
            colors: [AppColors.orange, AppColors.darkPink],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
      ],
      done: Done(
        child: IconButton(
            onPressed: () {
              ConnectionAlert.checkConnectivity(context);
              LocalData.set(key: SharedKeys.firstTime, value: false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: Icon(
              Icons.done,
              color: AppColors.white,
              size: 30,
            )),
        home: LoginScreen(),
      ),
      next: Next(
        child: Icon(
          Icons.arrow_forward,
          color: AppColors.white,
          size: 30,
        ),
      ),
      back: Back(
        child: Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 30,
        ),
      ),
      dotIndicator: DotIndicator(),
    );
  }
}
