import 'package:flutter/material.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Others/Chat/Chats/chats.dart';
import 'package:vroom_driver/Others/More/more.dart';
import 'package:vroom_driver/Others/MyRides/my_rides.dart';
import 'package:vroom_driver/Others/RideRequests/ride_requests.dart';
import 'package:vroom_driver/Others/Wallet/wallet.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    MyRides(),
    Chats(),
    RideRequests(),
    Wallet(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.directions_car_sharp,
        ),
        label: locale.passengers,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_rounded,
        ),
        label: locale.chats,
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
    return Scaffold(
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
    );
  }
}
