import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Components/entryField.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Theme/colors.dart';

class SendToBank extends StatefulWidget {
  @override
  _SendToBankState createState() => _SendToBankState();
}

class _SendToBankState extends State<SendToBank> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.sendToBank.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Container(
              width: double.infinity,
              color: entryFieldColor,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.availableWalletBalance,
                      style: theme.textTheme.headline6.copyWith(
                          color: textColor, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$ 120',
                      style: theme.textTheme.headline6.copyWith(
                          fontSize: 45, letterSpacing: 2, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 30),
              child: Text(
                locale.enterBankInfo,
                style: theme.textTheme.headline6
                    .copyWith(color: textColor, fontWeight: FontWeight.w500),
              ),
            ),
            EntryField(
              label: locale.accountNumber,
              // initialValue: '1122 3344 5566 778',
              borderRadiusTopLeft: Radius.circular(12),
              borderRadiusTopRight: Radius.circular(12),
            ),
            EntryField(
              label: locale.accountHolderName,
              // initialValue: 'Sam Smith',
            ),
            EntryField(
              label: locale.bankCode,
              // initialValue: 'XYZBANK001',
              borderRadiusBottomLeft: Radius.circular(12),
              borderRadiusBottomRight: Radius.circular(12),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 24, bottom: 16),
              child: Text(
                locale.enterAmountToTransfer,
                style: theme.textTheme.headline6
                    .copyWith(color: textColor, fontWeight: FontWeight.w500),
              ),
            ),
            EntryField(
              label: locale.enterAmount,
              // initialValue: '\$ 100',
              borderRadiusBottomLeft: Radius.circular(12),
              borderRadiusBottomRight: Radius.circular(12),
              borderRadiusTopRight: Radius.circular(12),
              borderRadiusTopLeft: Radius.circular(12),
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              onTap: () {
                Navigator.pop(context);
              },
              label: locale.proceed,
              bgColor: theme.primaryColor,
              height: 50,
              labelStyle: theme.textTheme.headline6.copyWith(letterSpacing: 2),
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
