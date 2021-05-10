import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/entryFieldForProfile.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class Reviews {
  final String name;
  final String image;
  final String date;

  Reviews(this.name, this.image, this.date);
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    List<Reviews> _reviews = [
      Reviews(
          'Anthony Smith', 'assets/ProfileImages/man5.png', '15 April,2017'),
      Reviews('Emili Hemilton', 'assets/ProfileImages/women 1.png',
          '15 April,2017'),
      Reviews(
          'Anthony Smith', 'assets/ProfileImages/man2.png', '15 April,2017'),
      Reviews(
          'Anthony Smith', 'assets/ProfileImages/man3.png', '15 April,2017'),
      Reviews(
          'Anthony Smith', 'assets/ProfileImages/man4.png', '15 April,2017'),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            locale.myProfile.toUpperCase(),
            style: theme.textTheme.headline6,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 34,
                    child: Image.asset('assets/ProfileImages/man1.png',
                        fit: BoxFit.fill),
                  ),
                  Column(
                    children: [
                      Text(
                        'George Williamson',
                        style: theme.textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
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
                          Icon(
                            Icons.star,
                            color: secondaryColor,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '(53 ' + locale.reviews + ')',
                            style: theme.textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: TabBar(
                isScrollable: true,
                labelColor: theme.primaryColor,
                labelPadding: EdgeInsets.symmetric(horizontal: 65),
                unselectedLabelColor: hintTextColor,
                indicatorColor: theme.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    text: locale.about,
                  ),
                  Tab(
                    text: locale.reviews,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  FadedSlideAnimation(
                    ListView(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 6,
                          color: Color(0xffE7EAEC),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            locale.personalInfo,
                            style: theme.textTheme.bodyText2.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        EntryFieldForProfile(
                          label: locale.profession,
                          initialValue: 'Graphic Designer at Rainbow Graphics',
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 6,
                          color: Color(0xffE7EAEC),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.verifyMyID);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              locale.verification,
                              style: theme.textTheme.bodyText2.copyWith(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.phoneVerification,
                                initialValue: '+91 987 654 3210',
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 16,
                              color: theme.primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.government,
                                initialValue: 'Licence Verified',
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 16,
                              color: theme.primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 6,
                          color: Color(0xffE7EAEC),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            locale.carInfo,
                            style: theme.textTheme.bodyText2.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.carBrand,
                                initialValue: 'Honda',
                              ),
                            ),
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.carModel,
                                initialValue: 'Civik',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.seatsForPassengers,
                                initialValue: '3 Seats',
                                height: 66,
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 26,
                                  color: textColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                height: 66,
                                label: locale.airConditionerAvailability,
                                initialValue: 'Ac Available',
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 26,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.carNumber,
                                initialValue: 'HR06 1234',
                              ),
                            ),
                            Expanded(
                              child: EntryFieldForProfile(
                                padding: const EdgeInsets.only(left: 16.0),
                                label: locale.carColor,
                                initialValue: 'White',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 6,
                          color: Color(0xffE7EAEC),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          color: theme.primaryColor,
                          child: Center(
                            child: Text(
                              locale.updateInfo,
                              style: theme.textTheme.headline6,
                            ),
                          ),
                        ),
                      ],
                    ),
                    beginOffset: Offset(0, 0.3),
                    endOffset: Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                  ),

                  // second tab bar view widget
                  FadedSlideAnimation(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 4,
                          color: Color(0xffE7EAEC),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                '5',
                                style: theme.textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: secondaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    theme.primaryColor,
                                    Color(0xffE7EAEC),
                                  ], stops: [
                                    0.6,
                                    0.9,
                                  ])),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '56',
                                style: theme.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                '4',
                                style: theme.textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: secondaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    theme.primaryColor,
                                    Color(0xffE7EAEC),
                                  ], stops: [
                                    0.5,
                                    0.7,
                                  ])),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '32',
                                style: theme.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                '3',
                                style: theme.textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: secondaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    theme.primaryColor,
                                    Color(0xffE7EAEC),
                                  ], stops: [
                                    0.2,
                                    0.3,
                                  ])),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '10',
                                style: theme.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                '2',
                                style: theme.textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: secondaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    theme.primaryColor,
                                    Color(0xffE7EAEC),
                                  ], stops: [
                                    0.3,
                                    0.4,
                                  ])),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '12',
                                style: theme.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                ' 1',
                                style: theme.textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: secondaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    theme.primaryColor,
                                    Color(0xffE7EAEC),
                                  ], stops: [
                                    0.1,
                                    0.2,
                                  ])),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ' 5',
                                style: theme.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 4,
                          color: Color(0xffE7EAEC),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _reviews.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 4,
                                      color: Color(0xffE7EAEC),
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child:
                                            Image.asset(_reviews[index].image),
                                      ),
                                      title: Row(
                                        children: [
                                          Text(_reviews[index].name,
                                              style: theme.textTheme.bodyText2
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 3)),
                                          Spacer(),
                                          Text(
                                            _reviews[index].date,
                                            style: theme.textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        children: [
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
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, laboris nisi ut aliquip ex ea commodo consequat.',
                                            style: theme.textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 0,
                                          bottom: 8),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                    beginOffset: Offset(0, 0.3),
                    endOffset: Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}