import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Others/Chat/Chats/chats.dart';
import 'package:vroom_driver/Others/More/more.dart';
import 'package:vroom_driver/Others/MyRides/my_rides.dart';
import 'package:vroom_driver/Others/RideRequests/ride_requests.dart';
import 'package:vroom_driver/Others/Wallet/wallet.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/apis/authCall.dart';

import '../main.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;
  String token;

  final List<Widget> _children = [
    Chats(),
    MyRides(),
    RideRequests(),
    Wallet(),
    More(),
  ];

  setToken() async {
    token = await hiveCalls.getPushToken();
    print("token $token");
  }

  @override
  void initState() {
    super.initState();

    setToken();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        // Navigator.pushNamed(context, '/message',
        // arguments: MessageArguments(message, true));
        print("message $message");
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_rounded,
        ),
        label: locale.chats,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.directions_car_sharp,
        ),
        label: locale.passengers,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.group_add,
        ),
        label: locale.rideRequests,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.account_balance_wallet_rounded,
        ),
        label: locale.wallet,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: locale.more,
      ),
    ];
    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 16.0),
            title: Text('Are you sure you want to quit?'),
            actions: <Widget>[
              TextButton(
                  child: Text('sign out'),
                  onPressed: () => Navigator.of(context).pop(true)),
               TextButton(
                  child: Text('cancel'),
                  onPressed: () => Navigator.of(context).pop(false)),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: IndexedStack(
          children: _children,
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: theme.hintColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
        ),
      ),
    );
  }
}
