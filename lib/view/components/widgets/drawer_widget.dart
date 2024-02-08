import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';
import '../../../view_model/bloc/auth_cubit/auth_cubit.dart';
import '../../../view_model/bloc/drawer_cubit/drawer_cubit.dart';
import '../../../view_model/data/local/shared_prefrence/shared_prefrence.dart';
import '../../../view_model/utils/app_colors.dart';
import '../../../view_model/utils/connection_alert.dart';
import '../../../view_model/utils/imgs.dart';
import '../../screens/login/login.dart';
import '../customs/button_custom.dart';
import '../customs/listtile_custom.dart';
import '../customs/text_custom.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = DrawerCubit.get(context);
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: Theme.of(context).colorScheme.primary,
          width: MediaQuery.of(context).size.width / 1.7,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.none,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  color: AppColors.orange,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 20,
                        child: SvgPicture.asset(
                          Images.avatar,
                          height: 35,
                          matchTextDirection: true,
                          fit: BoxFit.cover,
                          theme: const SvgTheme(currentColor: AppColors.gray),
                          width: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextCustom(
                          text: LocalData.get(SharedKeys.username),
                          color: AppColors.white,
                          fontSize: 16,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return ListTileCustom(
                        onTap: () {
                          ConnectionAlert.checkConnectivity(context);
                          cubit.selectedItem(index);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cubit.itemScreen[index],
                            ),
                          );
                        },
                        item: cubit.items[index].tr(),
                        isSelected: cubit.selectedItemIndex == index,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: cubit.items.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                          text: "${LocaleKeys.language.tr()} :",
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 8,
                      ),
                      ToggleButtons(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextCustom(
                              text: LocaleKeys.en.tr(),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextCustom(
                              text: LocaleKeys.ar.tr(),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                        isSelected: [
                          context.locale == Locale('en'),
                          context.locale == Locale('ar'),
                        ],
                        onPressed: (int index) {
                              cubit.toggleLanguage(context)
                              .then((value) {
                                Phoenix.rebirth(context);
                            cubit.selectedItemIndex = 0;
                          });
                        },
                        fillColor: AppColors.orange,
                        hoverColor: AppColors.blue.withOpacity(0.5),
                        renderBorder: true,
                        selectedBorderColor: AppColors.red,
                        disabledBorderColor: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                        borderWidth: 2.8,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextCustom(
                      text: LocaleKeys.darkMode.tr(),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.light_mode,
                            color: AppColors.black,
                          ),
                          Switch(
                            thumbIcon: MaterialStateProperty.all(Icon(
                              Icons.light_mode,
                              color: Colors.white,
                            )),
                            autofocus: true,
                            value:
                                LocalData.get(SharedKeys.isSwitched) ?? false,
                            onChanged: (value) {
                              cubit.toggleSwitch();
                            },
                            thumbColor: MaterialStateProperty.all(Colors.white),
                            activeTrackColor: Colors.black,
                            activeColor: Colors.blueAccent,
                            inactiveTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.grey[300],
                          ),
                          Icon(
                            Icons.dark_mode,
                            color: AppColors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        padding: 12,
                        color: AppColors.orange,
                        onPressed: state is! LogoutLoadingState
                            ? () {
                                ConnectionAlert.checkConnectivity(context);
                                AuthCubit.get(context)
                                    .logoutWithApi(context: context)
                                    .then((value) {
                                  if (AuthCubit.get(context).state
                                      is LogoutSuccessState) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                });
                              }
                            : null,
                        child: Visibility(
                          visible: state is! LogoutLoadingState,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout,
                                color: AppColors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              TextCustom(
                                text: LocaleKeys.Logout.tr(),
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                height: 1.8,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
