import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/model/my_course_model.dart';

import '../../customs/text_custom.dart';

class MyLearningWidget extends StatelessWidget {
  final MyCourses courses;
  final Color? color;
  final void Function()? onTap;

  const MyLearningWidget({
    super.key,
    required this.courses,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              shape: BoxShape.rectangle,
              color: color),
          margin: const EdgeInsets.all(6),
          child: Row(
            children: [
              FastCachedImage(
                url: courses.image ?? "",
                width: 120,
                height: 100,
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
                            width: 120,
                            height: 100,
                            child: CircularProgressIndicator(color: Colors.red, value: progress.progressPercentage.value)),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: TextCustom(
                text: courses.title ?? "",
                fontWeight: FontWeight.bold,
                maxLines: 2,
                fontSize: 18,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
