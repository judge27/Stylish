import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish/model/websiteslogo_model.dart';

import '../../const.dart';

// ignore: must_be_immutable
class WebsitesLogoItem extends StatelessWidget {
  const WebsitesLogoItem({
    super.key,
    required this.item,
  });
  final WebsitesLogoModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "- OR Continue with -",
            style: TextStyle(
              color: item.accountColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: item.onGoogleTaped,
              child: CircleAvatar(
                radius: 33.5,
                backgroundColor: const Color(0xFFF83758),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFFFFFFFF),
                  child: Image.asset(google),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: item.onAppleTaped,
              child: CircleAvatar(
                radius: 33.5,
                backgroundColor: const Color(0xFFF83758),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFFFFFFFF),
                  child: Image.asset(apple),
                ),
              ),
            ),
            const SizedBox(
              width: 28,
            ),
            GestureDetector(
              onTap: item.onFacebookTaped,
              child: CircleAvatar(
                radius: 33.5,
                backgroundColor: const Color(0xFFF83758),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFFFFFFFF),
                  child: Image.asset(facebook),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                item.accountText!,
                style: TextStyle(
                  color: item.accountColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: item.onSignTaped,
                child: Text(item.signinText!,
                    style: TextStyle(
                      color: item.accountColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
