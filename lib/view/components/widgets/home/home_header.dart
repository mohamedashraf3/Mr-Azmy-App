import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';

import '../../../../view_model/utils/app_colors.dart';
import '../../../../view_model/utils/imgs.dart';
import '../../customs/text_custom.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.orange,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TextCustom(
              text: LocaleKeys.Mr.tr(),
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1,
               color: AppColors.black,
            ),
             TextCustom(
                text: LocaleKeys.Mr_name.tr(),
                fontSize: 32,
                color: AppColors.black,
                fontWeight: FontWeight.w700),
             TextCustom(
              text: LocaleKeys.about_Mr.tr(),
               color: AppColors.textColor,
            ),
            Center(
              child: Image.asset(
                Images.homeBanner,
                height: MediaQuery.of(context).size.height / 3.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
