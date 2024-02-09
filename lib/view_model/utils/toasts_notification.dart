import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';

import '../../view/components/customs/text_custom.dart';

class NotificationHelper {
  static void showSuccessNotification(
      {required String description, required BuildContext context}) {
    ElegantNotification.success(
        description: TextCustom(
      text: description,
      fontSize: 18,
      color: AppColors.black,
    )).show(context);
  }

  static void showInfoNotification(
      {required String description, required BuildContext context}) {
    ElegantNotification.info(
        description: TextCustom(
      text: description,
      fontSize: 18,
      color: AppColors.black,
    )).show(context);
  }
}
