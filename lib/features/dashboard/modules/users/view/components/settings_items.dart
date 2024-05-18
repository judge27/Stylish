import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/extension/context_extension.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({super.key,required this.iconData, this.onTap,required this.pageName,this.fontColor});
   final IconData iconData;
   final String pageName;
   final Function()? onTap;
   final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.15)
        ),
        height: context.height/14.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData,color: fontColor??Theme.of(context).hintColor,),
            SizedBox(width: 15,),
            Text(pageName,style: TextStyle(
                color: fontColor??Theme.of(context).hintColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),),
            Spacer(),
            Icon(Icons.arrow_forward_ios_sharp,size: 14,color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
