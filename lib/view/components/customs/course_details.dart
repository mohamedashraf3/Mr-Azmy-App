import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';
import '../../../view_model/utils/app_colors.dart';
import 'button_custom.dart';

class CourseDetails extends StatelessWidget {
  final String courseImage;
  final String courseTitle;
  final void Function()? onPressedEnroll;
  final void Function()? onPressedView;
  final bool visible;
  final Color? color;

  const CourseDetails({
    Key? key,
    required this.courseImage,
    required this.courseTitle,
    this.onPressedEnroll,
    required this.visible,
    this.onPressedView,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = 205;
    double imageHeight = 120;

    return Container(
      margin: const EdgeInsets.all(12),
      width: containerWidth,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColors.textColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          FastCachedImage(
            url: courseImage,
            width: containerWidth,
            height: imageHeight,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(seconds: 1),
            errorBuilder: (context, exception, stacktrace) {
              return Text(stacktrace.toString());
            },
            loadingBuilder: (context, progress) {
              return Container(
                color: Colors.grey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                        width: containerWidth,
                        height: imageHeight,
                        child: CircularProgressIndicator(color: Colors.red, value: progress.progressPercentage.value)),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          TextCustom(
            text: courseTitle,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: visible,
                replacement: CustomButton(
                  radius: 5,
                  onPressed: onPressedEnroll,
                  color: AppColors.green,
                  padding: 6,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.plus,
                        color: AppColors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      TextCustom(
                        text: LocaleKeys.enroll.tr(),
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                child: CustomButton(
                  radius: 5,
                  onPressed: onPressedView,
                  color: AppColors.red,
                  padding: 6,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.eye,
                        color: AppColors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      TextCustom(
                        text: LocaleKeys.view.tr(),
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
