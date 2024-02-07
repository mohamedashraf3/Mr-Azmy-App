import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_azmi/view/components/customs/social_icon.dart';
import 'package:mr_azmi/view_model/utils/constant_img.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';
import '../../../view_model/utils/app_colors.dart';
import '../customs/text_custom.dart';
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.secondary,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              SocialIcon(icon: FontAwesomeIcons.whatsapp, url: ConstLinks.whatsapp,color: AppColors.green,),
              SizedBox(width: 8),
              SocialIcon(icon: FontAwesomeIcons.facebook, url:ConstLinks.facebook,color: AppColors.blue),
              SizedBox(width: 8),
              SocialIcon(icon: FontAwesomeIcons.youtube, url: ConstLinks.youtube,color: AppColors.red,),
              SizedBox(width: 8),
              SocialIcon(icon: Icons.language, url: ConstLinks.ourWebsite,color: AppColors.blue)
            ],
          ),
          TextCustom(
            fontSize: 15,
            text:LocaleKeys.Copyright.tr(),
          ),
        ],
      ),
    );
  }
}
