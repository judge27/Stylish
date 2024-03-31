import 'package:flutter/material.dart';

class WebsitesLogoModel {
  WebsitesLogoModel(
      {this.onAppleTaped,
      this.onFacebookTaped,
      this.onGoogleTaped,
      this.accountText,
      this.onSignTaped,
      this.signinText,
      this.accountColor,
      this.siginColor});

  Function()? onGoogleTaped;
  Function()? onAppleTaped;
  Function()? onFacebookTaped;
  Function()? onSignTaped;
  final String? accountText;
  final String? signinText;
  final Color? accountColor;
  final Color? siginColor;
}
