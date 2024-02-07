import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
