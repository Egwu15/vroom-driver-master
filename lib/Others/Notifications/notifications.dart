import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Locale/locales.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class NotificationsDetails {
  final String notification;
  final String status;
  final String date;

  NotificationsDetails(this.notification, this.status, this.date);
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    List<NotificationsDetails> _notificationsDetail = [
      NotificationsDetails(
          locale.davidJohnsonApprovedYour + '\n' + locale.requestForARide,
          locale.newRequest,
          '22 Feb, 2019, 11:40 am'),
      NotificationsDetails(
          locale.davidJohnsonRejectedYour + '\n' + locale.requestForARide,
          locale.cancelled,
          '22 Feb, 2019, 11:40 am'),
      NotificationsDetails(
          locale.davidJohnsonApprovedYour + '\n' + locale.requestForARide,
          locale.newRequest,
          '22 Feb, 2019, 11:40 am'),
      NotificationsDetails(
          locale.davidJohnsonApprovedYour + '\n' + locale.requestForARide,
          locale.newRequest,
          '22 Feb, 2019, 11:40 am'),
      NotificationsDetails(
          locale.davidJohnsonApprovedYour + '\n' + locale.requestForARide,
          locale.newRequest,
          '22 Feb, 2019, 11:40 am'),
      NotificationsDetails(
          locale.davidJohnsonRejectedYour + '\n' + locale.requestForARide,
          locale.cancelled,
          '22 Feb, 2019, 11:40 am'),
      NotificationsDetails(
          locale.davidJohnsonApprovedYour + '\n' + locale.requestForARide,
          locale.newRequest,
          '22 Feb, 2019, 11:40 am'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.notifications.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        ListView.builder(
            itemCount: _notificationsDetail.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Color(0xffE7EAEC),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          _notificationsDetail[index].status,
                          style: theme.textTheme.headline6.copyWith(
                              fontSize: 15,
                              color: index == 1 || index == 5
                                  ? Colors.red
                                  : theme.primaryColor,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              height: 2),
                        ),
                        Spacer(),
                        Text(
                          _notificationsDetail[index].date,
                          style: theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      _notificationsDetail[index].notification,
                      style: theme.textTheme.bodyText2.copyWith(
                          fontSize: 13.3, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
