import 'package:flutter/material.dart';
import 'package:stylish/features/auth/getstarted/view/components/getstarted_widget.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GetStartedWidget(),
    );
  }
}
