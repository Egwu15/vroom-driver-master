import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: [
            Stack(children: [
              Image.asset(
                'assets/backgroundImage.png',
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              PositionedDirectional(
                top: 40,
                start: 16,
                end: 0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: theme.scaffoldBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      locale.verification.toUpperCase(),
                      style: theme.textTheme.headline6,
                    )
                  ],
                ),
              ),
            ]),
            Spacer(
              flex: 2,
            ),
            Text(
              locale.enterConfirmationCode + '\n' + locale.sentToYouOnYourSms,
              style: theme.textTheme.bodyText1,
            ),
            Spacer(),
            CustomButton(
              bgColor: entryFieldColor,
              height: 55,
              label: '5 2 6 8 7 2',
              labelStyle: theme.textTheme.headline5
                  .copyWith(color: textColor, fontSize: 20),
            ),
            CustomButton(
              height: 55,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.appNavigation);
              },
              label: locale.next,
              labelStyle: theme.textTheme.headline6,
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
