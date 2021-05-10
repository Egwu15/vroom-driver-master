import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Components/textField.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class FareRate extends StatefulWidget {
  @override
  _FareRateState createState() => _FareRateState();
}

class _FareRateState extends State<FareRate> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: entryFieldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          locale.rideSummary,
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Text(
                    locale.weHopeYouHadAGreatRide,
                    style: theme.textTheme.subtitle2.copyWith(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '22nd Feb, 2018, 12:20 pm',
                    style: theme.textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '\$ 120',
                    style: theme.textTheme.subtitle2.copyWith(
                      color: theme.primaryColor,
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    locale.paymentHasBeenDoneVia +
                        '\n' +
                        '         ' +
                        locale.yourVroomWallet,
                    style: theme.textTheme.subtitle2.copyWith(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: PointsClipper(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 40,
                color: theme.scaffoldBackgroundColor,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                clipper: PointsClipper(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  height: 40,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height * 0.475,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        locale.soHowWasYourExperienceWith,
                        style: theme.textTheme.subtitle2,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('assets/ProfileImages/man5.png'),
                      ),
                      title: Row(
                        children: [
                          Text('David Johnson',
                              style: theme.textTheme.bodyText2.copyWith(
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            radius: 7,
                            child: Icon(
                              Icons.check,
                              color: theme.scaffoldBackgroundColor,
                              size: 12,
                            ),
                            backgroundColor: theme.primaryColor,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        locale.seniorArchitect,
                        style: theme.textTheme.subtitle2,
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 0, left: 50, right: 24, bottom: 12),
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.riderProfile);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: hintTextColor,
                          size: 32,
                        ),
                        Icon(
                          Icons.star,
                          color: hintTextColor,
                          size: 32,
                        ),
                        Icon(
                          Icons.star,
                          color: hintTextColor,
                          size: 32,
                        ),
                        Icon(
                          Icons.star,
                          color: hintTextColor,
                          size: 32,
                        ),
                        Icon(
                          Icons.star,
                          color: hintTextColor,
                          size: 32,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      hintText: locale.leaveAFeedback,
                      borderRadiusBottomLeft: Radius.circular(12),
                      borderRadiusTopRight: Radius.circular(12),
                      borderRadiusTopLeft: Radius.circular(12),
                      borderRadiusBottomRight: Radius.circular(12),
                      maxLines: 3,
                      height: 100,
                      width: 300,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.riderProfile);
                      },
                      label: locale.submitRating,
                      labelStyle: theme.textTheme.headline6,
                      bgColor: theme.primaryColor,
                      height: 50,
                    )
                  ],
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

class PointsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / 40;

    while (x < size.width) {
      x += increment;
      y = (y == size.height) ? size.height * .88 : size.height;
      path.lineTo(x + increment, y);
    }
    path.lineTo(size.width, 0.0);

    while (x > 0) {
      x -= increment;
      path.lineTo(x - increment, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
