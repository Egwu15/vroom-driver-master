import 'package:flutter/material.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class ConfirmRideRequest extends StatefulWidget {
  @override
  _ConfirmRideRequestState createState() => _ConfirmRideRequestState();
}

class _ConfirmRideRequestState extends State<ConfirmRideRequest> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              locale.rideRequest.toUpperCase(),
              style: theme.textTheme.headline6,
            ),
          ],
        ),
      ),
      body: ListView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'David Johnson'.padLeft(18),
                      style: theme.textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
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
                          '(115 ' + locale.reviews + ')',
                          style: theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ],
                )
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.person,
                color: theme.primaryColor,
              ),
              Text(
                locale.viewProfile.toUpperCase(),
                style: theme.textTheme.headline6.copyWith(
                  color: theme.primaryColor,
                  fontSize: 12,
                ),
              ),
              Container(
                width: 4,
                height: 50,
                color: Color(0xffE7EAEC),
              ),
              Icon(
                Icons.message,
                color: theme.primaryColor,
              ),
              Text(
                locale.message.toUpperCase(),
                style: theme.textTheme.headline6.copyWith(
                  color: theme.primaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 4,
            color: Color(0xffE7EAEC),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            locale.addresses.padLeft(20),
            style: theme.textTheme.subtitle1.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: theme.primaryColor,
                  ),
                  Container(
                    width: 1,
                    height: 58,
                    color: hintTextColor,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: secondaryColor,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: locale.pickupLocation + ' \n',
                        style: theme.textTheme.subtitle2,
                      ),
                      TextSpan(
                        text:
                            '104, Central Building, Near HSBC Bank\nWashington, New York\n',
                        style: theme.textTheme.bodyText2.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: locale.dropLocation + ' \n',
                        style: theme.textTheme.subtitle2,
                      ),
                      TextSpan(
                        text:
                            'Apex, Designs. B-52, World trade building,\nHarison, New York',
                        style: theme.textTheme.bodyText2.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 4,
            color: Color(0xffE7EAEC),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            locale.rideInfo.padLeft(20),
            style: theme.textTheme.subtitle1.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: locale.pickupDate + ' \n',
                      style: theme.textTheme.subtitle2,
                    ),
                    TextSpan(
                      text: '22 Feb, 2018',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: 80,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: locale.fareToCollect + ' \n',
                      style: theme.textTheme.subtitle2,
                    ),
                    TextSpan(
                      text: '\N 120.00',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: locale.pickupTime + ' \n',
                      style: theme.textTheme.subtitle2,
                    ),
                    TextSpan(
                      text: '12:15 pm',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: 80,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: locale.seatsRequested + ' \n',
                      style: theme.textTheme.subtitle2,
                    ),
                    TextSpan(
                      text: '2 Seats',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ]),
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xffE7EAEC),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
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
                        locale.reject.toUpperCase(),
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.fareRate);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          locale.acceptRequest.toUpperCase(),
                          style: theme.textTheme.headline6.copyWith(
                              color: theme.scaffoldBackgroundColor,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
