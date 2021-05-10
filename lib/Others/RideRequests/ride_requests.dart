import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class RideRequests extends StatefulWidget {
  @override
  _RideRequestsState createState() => _RideRequestsState();
}

class InformationOfRides {
  final String image;
  final String name;
  final String numberOfReviews;
  final String price;
  final String numberOfSeatsLeft;
  final String source;
  final String destination;
  final String time;
  InformationOfRides(
    this.image,
    this.name,
    this.numberOfReviews,
    this.price,
    this.numberOfSeatsLeft,
    this.source,
    this.destination,
    this.time,
  );
}

class _RideRequestsState extends State<RideRequests> {
  List<InformationOfRides> _informationOfRides = [
    InformationOfRides(
      'assets/ProfileImages/man1.png',
      'David Johnson',
      '115',
      '15.00',
      '3',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/women 1.png',
      'Emili Watson',
      '214',
      '16.00',
      '3',
      'Washington Union City, New York',
      'Kearny, North Arlington, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/man3.png',
      'George Smith',
      '99',
      '12.00',
      '2',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/man4.png',
      'Remmy Hemilton',
      '89',
      '18.00',
      '1',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/man5.png',
      'David Johnson',
      '115',
      '15.00',
      '3',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/women 1.png',
      'Harshu Makkar',
      '115',
      '15.00',
      '3',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/man2.png',
      'David Johnson',
      '115',
      '15.00',
      '3',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
    InformationOfRides(
      'assets/ProfileImages/man1.png',
      'David Johnson',
      '115',
      '15.00',
      '3',
      'Washington Sq. park, New York',
      'Harison, East Newark, New York',
      '25 Feb, 10:00 am',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: false,
        title: Text(
          locale.rideRequests.toUpperCase().padLeft(16),
          style: theme.textTheme.headline6,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.addRide);
            },
            child: FadedScaleAnimation(
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1, color: theme.scaffoldBackgroundColor)
                    ],
                    color: theme.primaryColor),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.directions_car_sharp,
                      color: theme.scaffoldBackgroundColor,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(locale.editRide,
                        style: theme.textTheme.bodyText1.copyWith(
                          color: theme.scaffoldBackgroundColor,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _informationOfRides.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  color: entryFieldColor,
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: [
                      ListTile(
                        leading: FadedScaleAnimation(
                          CircleAvatar(
                            child:
                                Image.asset(_informationOfRides[index].image),
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(_informationOfRides[index].name,
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
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: secondaryColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: secondaryColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: secondaryColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: secondaryColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: secondaryColor,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '(' +
                                  _informationOfRides[index].numberOfReviews +
                                  ' ' +
                                  locale.reviews +
                                  ')',
                              style: theme.textTheme.subtitle2,
                            )
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$' + _informationOfRides[index].price,
                                  style: theme.textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.w500,
                                      height: 2.2,
                                      color: textColor),
                                ),
                              ],
                            ),
                            Text(
                              _informationOfRides[index].numberOfSeatsLeft +
                                  ' ' +
                                  'Seats' +
                                  ' ',
                              style: theme.textTheme.subtitle2,
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.riderProfile);
                        },
                      ),
                      Row(
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: theme.primaryColor,
                              ),
                              Container(
                                width: 1,
                                height: 8,
                                color: hintTextColor,
                              ),
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: secondaryColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                _informationOfRides[index].source,
                                style: theme.textTheme.subtitle2,
                              ),
                              Text(
                                _informationOfRides[index].destination,
                                style: theme.textTheme.subtitle2,
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 6,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageRoutes.confirmRideRequest);
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              _informationOfRides[index].time,
                              style: theme.textTheme.subtitle2.copyWith(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                            Spacer(),
                            FadedScaleAnimation(
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: theme.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 1,
                                        color: Colors.red,
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    locale.reject,
                                    style: theme.textTheme.subtitle2.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            FadedScaleAnimation(
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    locale.accept,
                                    style: theme.textTheme.subtitle2.copyWith(
                                      color: theme.scaffoldBackgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
