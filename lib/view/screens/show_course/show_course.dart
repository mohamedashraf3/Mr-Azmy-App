import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/model/sections_model.dart';
import 'package:mr_azmi/view/components/customs/button_custom.dart';
import 'package:mr_azmi/view/screens/section_content/section_content.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';

import '../../../view_model/utils/connection_alert.dart';
import '../../components/customs/custom_appbar.dart';
import '../../components/customs/text_custom.dart';

class ShowCourseDetails<T> extends StatelessWidget {
  final dynamic showData;

  const ShowCourseDetails({super.key, required this.showData});

  @override
  Widget build(BuildContext context) {
    var cubit = CourseCubit.get(context);
    return TickerMode(
      enabled: true,
      child: Scaffold(
        appBar: const AppBarCustom(title: ""),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      FastCachedImage(
                        url: showData.image ?? "",
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.fill,
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
                                    width: double.infinity,
                                    height: 250,
                                    child: CircularProgressIndicator(color: Colors.red, value: progress.progressPercentage.value)),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextCustom(
                        text: showData.title ?? '',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      TextCustom(
                          text: showData.shortDescription ?? '',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      const SizedBox(height: 8),
                      TextCustom(
                          text: showData.longDescription ?? '',
                          fontSize: 16,
                          color: AppColors.darkGray),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          width: 10,
                          height: 10,
                          onPressed: () {
                            ConnectionAlert.checkConnectivity(context);
                            CourseCubit.get(context)
                                .watchCourseById(id: showData.id)
                                .then((value) {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  cubit.initializeVideoController();
                                  return SectionContentScreen(
                                      watchSection: cubit.sectionModel?.data ??
                                          SectionData());
                                },
                              ));
                            });
                          },
                          child: TextCustom(
                            text: LocaleKeys.watch.tr(),
                            color: AppColors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
