import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.icon, required this.url, this.color});
  final IconData icon;
  final String url;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: FaIcon(icon,color:color,size: 35),
        onPressed: (){
      launchUrl(Uri.parse(url));
    });
  }
}
