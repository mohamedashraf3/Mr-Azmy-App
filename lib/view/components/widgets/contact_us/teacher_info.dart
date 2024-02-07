import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';

import '../../../../view_model/utils/app_colors.dart';

class TeacherInfoSection extends StatelessWidget {
  const TeacherInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextCustom(
            text:"${LocaleKeys.Mr.tr()} ${LocaleKeys.Mr_name.tr()}",
              fontSize: 24,
              fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 4),
          TextCustom(
            text:LocaleKeys.about_Mr.tr(),
                          fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppColors.darkGray,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
