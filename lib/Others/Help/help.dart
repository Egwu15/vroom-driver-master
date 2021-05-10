import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Theme/colors.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class Questions {
  String title;
  String subtitle;
  Questions(this.title, this.subtitle);
}

class _HelpState extends State<Help> {
  List<bool> isOpen = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Questions> _questions = [
      Questions(locale.tripsAndFare, locale.anyIssueRegardingYour),
      Questions(locale.payment, locale.problemWhilePaying),
      Questions(locale.appUsability, locale.anyIssueWhileUsing),
      Questions(locale.account, locale.accountInfoChangeDetails),
    ];
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text(
          locale.help.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Text(
                locale.chooseYourIssue,
                style: theme.textTheme.caption.copyWith(
                    color: hintTextColor, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: _questions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOpen[index] = !isOpen[index];
                            });
                          },
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 24),
                            tileColor: theme.scaffoldBackgroundColor,
                            title: Text(_questions[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: textColor, letterSpacing: 0)),
                            subtitle: Text(
                              _questions[index].subtitle,
                              style: theme.textTheme.subtitle2,
                            ),
                            trailing: isOpen[index]
                                ? Icon(
                                    Icons.keyboard_arrow_up,
                                    color: hintTextColor,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: hintTextColor,
                                  ),
                          ),
                        ),
                        isOpen[index]
                            ? SizedBox(
                                height: 5,
                              )
                            : SizedBox.shrink(),
                        isOpen[index]
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
                              )
                            : SizedBox.shrink(),
                        Container(
                          width: double.infinity,
                          height: 4,
                          color: Color(0xffE7EAEC),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
