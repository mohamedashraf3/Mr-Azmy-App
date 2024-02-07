import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';

import '../../../view_model/utils/app_colors.dart';
class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
        color:AppColors.paige ,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children:[
              Icon(icon, color:color??AppColors.darkGray,size:30 , ),
              const SizedBox(width: 4),
              TextCustom(text:label,fontSize: 18),
            ],
          ),
        ),
      ),
    );
  }
}