import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';
import 'package:mr_azmi/view/components/widgets/drawer_widget.dart';
import 'package:mr_azmi/view/components/widgets/footer_widget.dart';
import 'package:mr_azmi/view/components/widgets/home/courses_widget.dart';
import 'package:mr_azmi/view/components/widgets/home/home_header.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';
import '../../../view_model/utils/connection_alert.dart';
import '../../components/customs/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarCustom(),
      drawer: DrawerWidget(),
      body: RefreshIndicator(
        onRefresh: ()async{
          ConnectionAlert.checkConnectivity(context);
          CourseCubit.get(context).homeCourseModel=null;
          await CourseCubit.get(context).getHomeCourse();
          },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeHeader(),
              SizedBox(
                height: 10,
              ),
              TextCustom(
                text: LocaleKeys.AvailableCourses.tr(),
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
              CoursesWidget(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 5,
              ),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
