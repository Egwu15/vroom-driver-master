import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Components/textField.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class AddRide extends StatefulWidget {
  @override
  _AddRideState createState() => _AddRideState();
}

class _AddRideState extends State<AddRide> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.addRide.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/Ride.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          FadedSlideAnimation(
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    TextInput(
                      hintText: '\n' + locale.setPickupLocation,
                      borderRadiusTopLeft: Radius.circular(12),
                      borderRadiusTopRight: Radius.circular(12),
                      width: MediaQuery.of(context).size.width * 0.915,
                      height: 45,
                      prefixIcon: Icon(
                        Icons.circle,
                        color: theme.primaryColor,
                        size: 16,
                      ),
                    ),
                    PositionedDirectional(
                      start: 0,
                      end: 0,
                      top: 40,
                      child: TextInput(
                        height: 45,
                        hintText: locale.setDropLocation,
                        width: MediaQuery.of(context).size.width * 0.85,
                        borderRadiusBottomLeft: Radius.circular(12),
                        borderRadiusBottomRight: Radius.circular(12),
                        prefixIcon: Icon(
                          Icons.circle,
                          color: secondaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 40,
                      top: 28,
                      child: Container(
                        width: 1,
                        height: 29,
                        color: hintTextColor,
                      ),
                    ),
                    PositionedDirectional(
                      end: 42,
                      top: 34,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 90,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 10,
                                  color: theme.scaffoldBackgroundColor,
                                ),
                                Text(
                                  ' ' + locale.addPickup,
                                  style: theme.textTheme.subtitle2.copyWith(
                                    color: theme.scaffoldBackgroundColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 90,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 10,
                                  color: theme.scaffoldBackgroundColor,
                                ),
                                Text(
                                  ' ' + locale.addDrop,
                                  style: theme.textTheme.subtitle2.copyWith(
                                    color: theme.scaffoldBackgroundColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                TextInput(
                  height: 45,
                  hintText: '\n' + locale.rideStartTime,
                  borderRadiusBottomRight: Radius.circular(12),
                  borderRadiusTopLeft: Radius.circular(12),
                  borderRadiusTopRight: Radius.circular(12),
                  borderRadiusBottomLeft: Radius.circular(12),
                  prefixIcon: Icon(
                    Icons.watch_later_outlined,
                    size: 22,
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                ),
                SizedBox(
                  height: 8,
                ),
                Theme(
                  data: ThemeData.dark(),
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: theme.primaryColor,
                    checkColor: theme.scaffoldBackgroundColor,
                    dense: true,
                    title: Text(
                      locale.returnOnSameRoute,
                      style: theme.textTheme.subtitle2
                          .copyWith(color: theme.primaryColor, fontSize: 13),
                    ),
                    value: this.checkValue,
                    onChanged: (value) {
                      setState(() {
                        this.checkValue = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: Text(
                    locale.selectTravelDays,
                    style: theme.textTheme.subtitle2
                        .copyWith(color: theme.primaryColor, fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Theme(
                          data: ThemeData.dark(),
                          child: CheckboxListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 24),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: theme.primaryColor,
                            checkColor: theme.scaffoldBackgroundColor,
                            dense: true,
                            title: Text(
                              'Monday',
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontSize: 13),
                            ),
                            value: this.checkValue,
                            onChanged: (value) {
                              setState(() {
                                this.checkValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Theme(
                          data: ThemeData.dark(),
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.only(right: 24),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: theme.primaryColor,
                            checkColor: theme.scaffoldBackgroundColor,
                            dense: true,
                            title: Text(
                              'Friday',
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontSize: 13),
                            ),
                            value: this.checkValue,
                            onChanged: (value) {
                              setState(() {
                                this.checkValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Theme(
                          data: ThemeData.dark(),
                          child: CheckboxListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 24),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: theme.primaryColor,
                            checkColor: theme.scaffoldBackgroundColor,
                            dense: true,
                            title: Text(
                              'Tuesday',
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontSize: 13),
                            ),
                            value: this.checkValue,
                            onChanged: (value) {
                              setState(() {
                                this.checkValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Theme(
                          data: ThemeData.dark(),
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.only(right: 24),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: theme.primaryColor,
                            checkColor: theme.scaffoldBackgroundColor,
                            dense: true,
                            title: Text(
                              'Saturday',
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontSize: 13),
                            ),
                            value: this.checkValue,
                            onChanged: (value) {
                              setState(() {
                                this.checkValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Theme(
                          data: ThemeData.dark(),
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.only(left: 24),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: theme.primaryColor,
                            checkColor: theme.scaffoldBackgroundColor,
                            dense: true,
                            title: Text(
                              'Wednesday',
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontSize: 13),
                            ),
                            value: this.checkValue,
                            onChanged: (value) {
                              setState(() {
                                this.checkValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Theme(
                          data: ThemeData.dark(),
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.only(right: 24),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: theme.primaryColor,
                            checkColor: theme.scaffoldBackgroundColor,
                            dense: true,
                            title: Text(
                              'Sunday',
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontSize: 13),
                            ),
                            value: this.checkValue,
                            onChanged: (value) {
                              setState(() {
                                this.checkValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: ThemeData.dark(),
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: theme.primaryColor,
                    checkColor: theme.scaffoldBackgroundColor,
                    dense: true,
                    title: Text(
                      'Thursday',
                      style: theme.textTheme.subtitle2.copyWith(
                          color: theme.scaffoldBackgroundColor, fontSize: 13),
                    ),
                    value: this.checkValue,
                    onChanged: (value) {
                      setState(() {
                        this.checkValue = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: Text(
                    locale.pricePerKmPerSeat,
                    style: theme.textTheme.subtitle2
                        .copyWith(color: theme.primaryColor, fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 12,
                        child: Icon(
                          Icons.remove,
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '\N 3',
                        style: theme.textTheme.headline6.copyWith(
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 12,
                        child: Icon(
                          Icons.add,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: CustomButton(
              borderRadius: BorderRadius.zero,
              margin: EdgeInsets.zero,
              label: locale.addRide,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.editRide);
              },
              height: 55,
              labelStyle: theme.textTheme.subtitle1
                  .copyWith(color: theme.scaffoldBackgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
