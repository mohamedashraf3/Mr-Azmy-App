import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/custom_appbar.dart';
import 'package:mr_azmi/view/components/widgets/contact_us/contact_section.dart';
import 'package:mr_azmi/view/components/widgets/drawer_widget.dart';
import 'package:mr_azmi/view/components/widgets/footer_widget.dart';

import '../../../view_model/utils/app_colors.dart';
import '../../components/widgets/contact_us/teacher_info.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: const AppBarCustom(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: TeacherInfoSection(),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: AppColors.paige,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: const Column(
                      children: [
                        ContactFormSection(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const FooterWidget(),
              ],
            ),
          ),
        ));
  }
}
