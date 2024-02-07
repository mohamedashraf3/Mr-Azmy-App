import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view/components/customs/custom_appbar.dart';
import 'package:mr_azmi/view/components/customs/custom_divider.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import 'package:video_player/video_player.dart';

import '../../../model/sections_model.dart';
import '../../../view_model/utils/connection_alert.dart';
import '../../components/customs/custom_chewie.dart';
import '../../components/customs/text_custom.dart';

class SectionContentScreen extends StatelessWidget {
  final SectionData watchSection;

  const SectionContentScreen({super.key, required this.watchSection});

  @override
  Widget build(BuildContext context) {
    var cubit = CourseCubit.get(context);
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return WillPopScope(
            onWillPop: () async {
              cubit.disposeVideoController();
              return true;
            },
            child: Scaffold(
              appBar: AppBarCustom(title: ""),
              body: watchSection.sections!.isEmpty
                  ? Center(
                      child: TextCustom(
                        text: "No Videos for This Course",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 250,
                              child: CustomChewie(
                                videoPlayerController:
                                    cubit.videoPlayerController ??
                                        VideoPlayerController.network(
                                            "default_video_url"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextCustom(
                                  text: cubit.selectedVideoName ?? "",
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        CustomDivider(
                          thickness: 2,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var section in watchSection.sections!)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextCustom(
                                            text: section.title ?? '',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if (section.subSections != null)
                                        for (var subSection
                                            in section.subSections!)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextCustom(
                                                    text:
                                                        subSection.title ?? '',
                                                    fontSize: 18.5,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              if (subSection.lessons != null)
                                                for (var lesson
                                                    in subSection.lessons!)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListTile(
                                                        title: TextCustom(
                                                          text: lesson.title ??
                                                              '',
                                                          fontSize: 17,
                                                          color: lesson.id ==
                                                                  cubit
                                                                      .selectedLessonId
                                                              ? Colors.red
                                                              : null,
                                                        ),
                                                        onTap: () {
                                                          ConnectionAlert
                                                              .checkConnectivity(
                                                                  context);
                                                          cubit.updateSelectedVideo(
                                                              videoName:
                                                                  lesson.title,
                                                              videoUrl: lesson
                                                                  .videoUrl,
                                                              lessonId:
                                                                  lesson.id);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                            ],
                                          ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ));
      },
    );
  }
}