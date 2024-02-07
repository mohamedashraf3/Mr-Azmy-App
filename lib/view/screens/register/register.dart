import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/widgets/register_widget.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            RegisterWidget()
          ],
        ),
      ),
    ),
    );
  }
}