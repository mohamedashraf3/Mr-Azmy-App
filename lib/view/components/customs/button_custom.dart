import 'package:flutter/material.dart';
import '../../../view_model/utils/app_colors.dart';
class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;
  final double? padding;
  final double? radius;


const CustomButton ({super.key,required this.onPressed, this.color, required this.child, this.width, this.height, this.padding, this.radius});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??16.0), ),
        ),
        minimumSize: MaterialStateProperty.all( Size(width??50, height??20)),
        backgroundColor: MaterialStateProperty.all(color ??AppColors.darkPink),
        padding: MaterialStateProperty.all( EdgeInsets.all(padding??12)),
      ),
      onPressed:onPressed,
      child: child,
    );
  }
}
