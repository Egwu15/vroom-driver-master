import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Theme/colors.dart';

class VerifyMyID extends StatefulWidget {
  @override
  _VerifyMyIDState createState() => _VerifyMyIDState();
}

class _VerifyMyIDState extends State<VerifyMyID> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.verifyMy.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                locale.upload,
                style: theme.textTheme.subtitle2.copyWith(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Text(
                locale.licence,
                style: theme.textTheme.headline6.copyWith(
                  color: textColor,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 100,
              height: 4,
              color: theme.primaryColor,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/Verify/ic_wrong.png',
                  scale: 2,
                ),
                Image.asset(
                  'assets/Verify/ic_wrong-2.png',
                  scale: 2,
                ),
                Image.asset(
                  'assets/Verify/ic_wrong-1.png',
                  scale: 2,
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/Verify/ic_correct.png',
              scale: 2.5,
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                Navigator.pop(context);
              },
              height: 50,
              label: locale.uploadNow.toUpperCase(),
              labelStyle: theme.textTheme.headline6,
            ),
            SizedBox(
              height: 10,
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
