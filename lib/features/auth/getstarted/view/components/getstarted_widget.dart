import 'package:flutter/material.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/auth/getstarted/view/components/background_image_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImageWidget(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 10,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child:  Text(
                    AppLocalizations.of(context)!.hereyougo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 43,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                  ),
                ),
                 Text(
                   AppLocalizations.of(context)!.finditnow,
                  style: TextStyle(
                    color: Color(0xFFF2F2F2),
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: InkWell(
                    onTap: () async{
                      Navigator.pushNamedAndRemoveUntil(context, Routes.DASHBOARD, (route) => false);
                    },
                    child: Core.instance.coreButton(buttonText:  AppLocalizations.of(context)!.getstarted,context: context),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ))
    ]);
  }
}
