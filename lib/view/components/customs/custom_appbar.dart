import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';
import '../../../view_model/bloc/drawer_cubit/drawer_cubit.dart';
import '../../../view_model/utils/app_colors.dart';
import '../../../view_model/utils/imgs.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const AppBarCustom({super.key,this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.orange,
      title: TextCustom(
        text: title ?? DrawerCubit.get(context)
            .items[DrawerCubit.get(context).selectedItemIndex]
            .tr(),
        fontSize: 22,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      actions: [
        Image.asset(
          Images.appBarLogo,
          width: MediaQuery.of(context).size.width / 4.5,
        )
      ],
    );
  }
}
