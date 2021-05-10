import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/textField.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';

class NoChatsToShow extends StatefulWidget {
  @override
  _NoChatsToShowState createState() => _NoChatsToShowState();
}

class _NoChatsToShowState extends State<NoChatsToShow> {


  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          locale.chats.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.chats);
        },
        child: FadedScaleAnimation(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/Placeholders/placeholders_chats.png',
                  scale: 1.5,
                ),
              ),
              Text(
                locale.noChatsToShow,
                style: theme.textTheme.headline6.copyWith(
                  color: hintTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _buildPopupDialog(BuildContext context) {
//   var theme = Theme.of(context);
//   var locale = AppLocalizations.of(context);

//   return new AlertDialog(
//     contentPadding: EdgeInsets.zero,
//     content: FadedSlideAnimation(
//       new Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ClipRRect(
//             child: Image.asset(
//               'assets/Icons/referNow.png',
//               width: 300,
//               height: 150,
//               fit: BoxFit.fill,
//             ),
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               locale.doYouHaveAnyReferralCode,
//               style: theme.textTheme.headline6
//                   .copyWith(color: theme.primaryColor, letterSpacing: 0),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.only(top: 8, bottom: 16, left: 24, right: 24),
//             child: Text(
//               locale.addReferralCode,
//               style: theme.textTheme.bodyText2,
//             ),
//           ),
//           TextInput(
//             hintText: locale.addSixDigitReferralCode,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     locale.iDontHave,
//                     style: theme.textTheme.headline6
//                         .copyWith(color: textColor, letterSpacing: 0),
//                   ),
//                   Spacer(),
//                   Text(
//                     locale.cont,
//                     style: theme.textTheme.headline6
//                         .copyWith(color: theme.primaryColor, letterSpacing: 0),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       beginOffset: Offset(0, 0.3),
//       endOffset: Offset(0, 0),
//       slideCurve: Curves.linearToEaseOut,
//     ),
//   );
// }
