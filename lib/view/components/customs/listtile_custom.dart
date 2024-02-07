import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';

import '../../../view_model/utils/app_colors.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.onTap,
    required this.item,
    required this.isSelected,
  });

  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Function()? onTap;
  final bool isSelected;
  final String item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      selectedTileColor: AppColors.darkPink,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: leading,
      title: TextCustom(
        text: item,
        fontWeight: FontWeight.bold,
        color: isSelected ? AppColors.white : AppColors.black,
      ),
      titleAlignment: ListTileTitleAlignment.center,
      trailing: trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      visualDensity: const VisualDensity(vertical: -4),
    );
  }
}
