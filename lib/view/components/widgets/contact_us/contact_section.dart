import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/button_custom.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';
import 'package:mr_azmi/view_model/utils/connection_alert.dart';
import 'package:mr_azmi/view_model/utils/toasts_notification.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';
import '../../customs/text_feild_custom.dart';
class ContactFormSection extends StatelessWidget {
  const ContactFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TextCustom(text: LocaleKeys.Contact_Form.tr(),fontSize: 24,fontWeight: FontWeight.bold,),
          const SizedBox(height: 16),
           TextFieldCustom(
            focusedBorderColor: AppColors.orange,
            labelText:LocaleKeys.Full_Name.tr() ,
          ),
          const SizedBox(height: 8,),
           TextFieldCustom(
            focusedBorderColor: AppColors.orange,
            labelText: LocaleKeys.email.tr()
          ),
          const SizedBox(height: 8,),
           TextFieldCustom(
            labelText: LocaleKeys.subject.tr(),
            focusedBorderColor: AppColors.orange,
          ),
          const SizedBox(height: 8,),
           TextFieldCustom(
            focusedBorderColor: AppColors.orange,
            maxLines: 4,
            labelText: LocaleKeys.massage.tr(),
          ),
          const SizedBox(height: 10,),
         Align(
             alignment: Alignment.center,
             child: CustomButton(
                 color:AppColors.darkGray,
                 onPressed: (){
                   ConnectionAlert.checkConnectivity(context);
                   ConnectionAlert.internetConnection(context);
                   NotificationHelper.showSuccessNotification(description: LocaleKeys.submitResponse.tr(), context: context);
                 }, child: TextCustom(text: LocaleKeys.submit.tr(),color: AppColors.white,)))
        ],
      ),
    );
  }
}