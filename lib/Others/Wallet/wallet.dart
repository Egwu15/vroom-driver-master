import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class ListOfPayments {
  final String image;
  final String title;
  final String subtitle;
  final String money;
  final String name;
  final String date;

  ListOfPayments(
      this.image, this.title, this.subtitle, this.money, this.name, this.date);
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    List<ListOfPayments> _listOfPayments = [
      ListOfPayments(
          'assets/ProfileImages/man5.png',
          locale.ridePayment,
          'Washington Sq Park to East Newark',
          '\N120',
          'David Johnson',
          '9th Feb, 05:15 pm'),
      ListOfPayments(
          'assets/ProfileImages/man2.png',
          locale.ridePayment,
          'Washington Sq Park to East Newark',
          '\N60',
          'Remmy Hemilton',
          '19th Feb, 09:15 pm'),
      ListOfPayments(
          'assets/ProfileImages/women 1.png',
          locale.ridePayment,
          'Washington Sq Park to East Newark',
          '\N60',
          'Emili Watson',
          '12th March, 05:15 pm'),
      ListOfPayments(
          'assets/appIcon.png',
          locale.addedToBank,
          'Washington Sq Park to East Newark',
          '\N10',
          'Wallet',
          '9th Feb, 05:15 pm'),
      ListOfPayments(
          'assets/ProfileImages/man3.png',
          locale.ridePayment,
          'Washington Sq Park to East Newark',
          '\N60',
          'Raun Watson',
          '8th March, 12:15 pm'),
    ];
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: [
            Expanded(
              child: Container(
                color: theme.primaryColor,
                child: Column(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Center(
                      child: Text(
                        locale.myWallet,
                        style: theme.textTheme.headline6
                            .copyWith(letterSpacing: 2),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Center(
                      child: Text(
                        locale.totalBalance,
                        style: theme.textTheme.bodyText2.copyWith(
                            color: theme.scaffoldBackgroundColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Center(
                      child: Text(
                        '\N 120',
                        style: theme.textTheme.headline6
                            .copyWith(fontSize: 45, letterSpacing: 2),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          label: locale.addMoney,
                          bgColor: secondaryColor,
                          labelStyle:
                              theme.textTheme.headline6.copyWith(fontSize: 12),
                          height: 40,
                        )),
                        Expanded(
                            child: CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.sendToBank);
                          },
                          label: locale.sendToBank,
                          height: 40,
                          bgColor: theme.scaffoldBackgroundColor,
                          labelStyle: theme.textTheme.headline6.copyWith(
                            color: theme.primaryColor,
                            fontSize: 12,
                          ),
                        )),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 4,
                        color: Color(0xffE7EAEC),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: _listOfPayments.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                leading: CircleAvatar(
                                  radius: 24,
                                  child: ClipRRect(
                                    child: Image.asset(
                                        _listOfPayments[index].image,
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(_listOfPayments[index].title,
                                            style: theme.textTheme.bodyText2
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            )),
                                        Spacer(),
                                        Text(
                                          _listOfPayments[index].money,
                                          style: theme.textTheme.subtitle2
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: theme.primaryColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      _listOfPayments[index].date,
                                      style: theme.textTheme.subtitle2
                                          .copyWith(fontSize: 8),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          _listOfPayments[index].subtitle,
                                          style: theme.textTheme.bodyText2
                                              .copyWith(
                                                  color: hintTextColor,
                                                  fontSize: 9),
                                        ),
                                        Spacer(),
                                        Text(
                                          _listOfPayments[index].name,
                                          style: theme.textTheme.bodyText2
                                              .copyWith(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 4,
                                color: Color(0xffE7EAEC),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
