import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class MyRides extends StatefulWidget {
  @override
  _MyRidesState createState() => _MyRidesState();
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
  final String carName;
  final String carColor;
  final String status;
  InformationOfRides(
      this.image,
      this.name,
      this.numberOfReviews,
      this.price,
      this.numberOfSeatsLeft,
      this.source,
      this.destination,
      this.time,
      this.carName,
      this.carColor,
      this.status);
}

class _MyRidesState extends State<MyRides> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    List<InformationOfRides> _informationOfRides = [
      InformationOfRides(
        'assets/ProfileImages/man1.png',
        'David Johnson',
        'Senior Architect at Alex Designs',
        '15',
        '3',
        'Washington Sq. park, New York',
        'Harison, East Newark, New York',
        'Today, 10:00 am',
        'Honda Civic',
        'White',
        'assets/StatusSymbols/pending.png',
      ),
      InformationOfRides(
        'assets/ProfileImages/women 1.png',
        'Emili Watson',
        'Marketing Manager at George & co',
        '16',
        '3',
        'Washington Union City, New York',
        'Kearny, North Arlington, New York',
        'Today, 10:00 am',
        'Toyota Corrola',
        'Red',
        'assets/StatusSymbols/accepted.png',
      ),
      InformationOfRides(
        'assets/ProfileImages/man3.png',
        'George Smith',
        'Graphic Designer at Yolo designs',
        '12',
        '2',
        'Washington Sq. park, New York',
        'Harison, East Newark, New York',
        'Today, 10:00 am',
        'Nissan Altima',
        'White',
        'assets/StatusSymbols/accepted.png',
      ),
      InformationOfRides(
        'assets/ProfileImages/man5.png',
        'David Johnson',
        'Senior Architect at Alex Designs',
        '15',
        '3',
        'Washington Sq. park, New York',
        'Harison, East Newark, New York',
        'Today, 10:00 am',
        'Honda Civic',
        'White',
        'assets/StatusSymbols/accepted.png',
      ),
      InformationOfRides(
        'assets/ProfileImages/women 1.png',
        'Harshu Makkar',
        'Senior Architect at Alex Designs',
        '15',
        '3',
        'Washington Sq. park, New York',
        'Harison, East Newark, New York',
        'Today, 10:00 am',
        'Honda Civic',
        'White',
        'assets/StatusSymbols/accepted.png',
      ),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Passenger'.toUpperCase(),
            style: theme.textTheme.headline6,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
            labelColor: theme.scaffoldBackgroundColor,
            unselectedLabelColor: theme.scaffoldBackgroundColor,
            indicatorColor: theme.scaffoldBackgroundColor,
            tabs: [
              Tab(text: locale.pending),
              Tab(text: locale.past),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FadedSlideAnimation(
              ListView.builder(
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
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Column(
                            children: [
                              ListTile(
                                leading: FadedScaleAnimation(
                                  CircleAvatar(
                                    child: Image.asset(
                                        _informationOfRides[index].image),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Text(_informationOfRides[index].name,
                                        style:
                                            theme.textTheme.bodyText2.copyWith(
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Spacer(),
                                    Text(
                                      '\N ' + _informationOfRides[index].price,
                                      style: theme.textTheme.bodyText1.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: theme.primaryColor),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  _informationOfRides[index].numberOfReviews,
                                  style: theme.textTheme.subtitle2,
                                ),
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.riderProfile);
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
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    _informationOfRides[index].time,
                                    style: theme.textTheme.subtitle2.copyWith(
                                        color: theme.primaryColor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Spacer(),
                                  Text(
                                    _informationOfRides[index]
                                            .numberOfSeatsLeft +
                                        ' ' +
                                        'Seats' +
                                        ' ',
                                    style: theme.textTheme.subtitle2.copyWith(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 85,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: theme.scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 1,
                                            color: theme.primaryColor,
                                          ),
                                        ]),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          color: theme.primaryColor,
                                          size: 16,
                                        ),
                                        Text(
                                          locale.message,
                                          style: theme.textTheme.subtitle2
                                              .copyWith(
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 85,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        locale.pickUp,
                                        style:
                                            theme.textTheme.subtitle2.copyWith(
                                          color: theme.scaffoldBackgroundColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 3,
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
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Column(
                            children: [
                              ListTile(
                                leading: FadedScaleAnimation(
                                  CircleAvatar(
                                    child: Image.asset(
                                        _informationOfRides[index].image),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Text(_informationOfRides[index].name,
                                        style:
                                            theme.textTheme.bodyText2.copyWith(
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Spacer(),
                                    Text(
                                      '\N ' + _informationOfRides[index].price,
                                      style: theme.textTheme.bodyText1.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: theme.primaryColor),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  _informationOfRides[index].numberOfReviews,
                                  style: theme.textTheme.subtitle2,
                                ),
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.riderProfile);
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
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    _informationOfRides[index].time,
                                    style: theme.textTheme.subtitle2.copyWith(
                                        color: theme.primaryColor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Spacer(),
                                  Text(
                                    _informationOfRides[index]
                                            .numberOfSeatsLeft +
                                        ' ' +
                                        'Seats' +
                                        ' ',
                                    style: theme.textTheme.subtitle2.copyWith(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 2,
                                  ),
                                  index == 0
                                      ? Container(
                                          width: 85,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text(
                                              locale.rateNow,
                                              style: theme.textTheme.subtitle2
                                                  .copyWith(
                                                color: theme
                                                    .scaffoldBackgroundColor,
                                              ),
                                            ),
                                          ),
                                        )
                                      : index == 1
                                          ? Column(
                                              children: [
                                                Text(
                                                  locale.rated,
                                                  style:
                                                      theme.textTheme.subtitle2,
                                                ),
                                                Row(
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
                                                  ],
                                                ),
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            )
                                          : index == 2
                                              ? Text(
                                                  locale.cancelledRide,
                                                  style:
                                                      theme.textTheme.subtitle2,
                                                )
                                              : SizedBox.shrink(),
                                ],
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
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ],
        ),
      ),
    );
  }
}
