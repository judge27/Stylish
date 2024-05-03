import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllModel {
 Color? backgroundColor;
 String? title;
 Function()? onViewAll;
 IconData ? prefixIcon;
 String? hintIconText;
 ViewAllModel({
   this.title,
   this.backgroundColor,
   this.hintIconText,
   this.onViewAll,
   this.prefixIcon
});

}