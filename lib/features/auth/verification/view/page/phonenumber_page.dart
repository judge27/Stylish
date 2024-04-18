import 'package:flutter/material.dart';
import 'package:stylish/features/auth/verification/view/components/phonenumber_widget.dart';
import 'package:stylish/features/auth/verification/view/components/verification_widget.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PhoneNumberWidget(),
    );
  }
}
