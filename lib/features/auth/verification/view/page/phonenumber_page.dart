import 'package:flutter/material.dart';
import 'package:stylish/features/auth/verification/view/components/phonenumber_widget.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: PhoneNumberWidget(),
    );
  }
}
