import 'package:flutter/material.dart';
import 'package:vroom_driver/AppNavigation/app_navigation.dart';
import 'package:vroom_driver/Auth/SignUp/sign_up.dart';
import 'package:vroom_driver/Auth/Verification/verification.dart';
import 'package:vroom_driver/Others/AddRide/add_ride.dart';
import 'package:vroom_driver/Others/ChangeLanguage/change_language.dart';
import 'package:vroom_driver/Others/Chat/ChatConversation/chat_conversation.dart';
import 'package:vroom_driver/Others/Chat/Chats/chats.dart';
import 'package:vroom_driver/Others/ConfirmRideRequest/confirmRideRequest.dart';
import 'package:vroom_driver/Others/EditRide/edit_ride.dart';
import 'package:vroom_driver/Others/FareRate/fare_rate.dart';
import 'package:vroom_driver/Others/Help/help.dart';
import 'package:vroom_driver/Others/MyProfile/myProfile.dart';
import 'package:vroom_driver/Others/Notifications/notifications.dart';
import 'package:vroom_driver/Others/RideRequests/ride_requests.dart';
import 'package:vroom_driver/Others/RiderProfile/rider_profile.dart';
import 'package:vroom_driver/Others/SendToBank/send_to_bank.dart';
import 'package:vroom_driver/Others/TermsAndConditions/terms_and_conditions.dart';
import 'package:vroom_driver/Others/VerifyMyID/verify_my_id.dart';

class PageRoutes {
  static const String signUp = 'sign_up';
  static const String verification = 'verification';
  static const String findARide = 'findARide';
  static const String listOfRides = 'listOfRides';
  static const String appNavigation = 'appNavigation';
  static const String referNow = 'referNow';
  static const String myProfile = 'myProfile';
  static const String termsAndConditions = 'termsAndConditions';
  static const String help = 'help';
  static const String riderProfile = 'riderProfile';
  static const String confirmRideRequest = 'confirmRideRequest';
  static const String chats = 'chats';
  static const String chatsConversation = 'chatsConversation';
  static const String sendToBank = 'sendToBank';
  static const String rideMap = 'rideMap';
  static const String changeLanguage = 'changeLanguage';
  static const String notifications = 'notifications';
  static const String fareRate = 'fareRate';
  static const String addRide = 'addRide';
  static const String editRide = 'editRide';
  static const String verifyMyID = 'verifyMyID';

  Map<String, WidgetBuilder> routes() {
    return {
      signUp: (context) => SignUpUI(),
      verification: (context) => Verification(),
      findARide: (context) => RideRequests(),
      appNavigation: (context) => AppNavigation(),
      myProfile: (context) => MyProfile(),
      termsAndConditions: (context) => TermsAndConditions(),
      help: (context) => Help(),
      riderProfile: (context) => RiderProfile(),
      confirmRideRequest: (context) => ConfirmRideRequest(),
      chats: (context) => Chats(),
      chatsConversation: (context) => ChatConversation(),
      sendToBank: (context) => SendToBank(),
      changeLanguage: (context) => ChangeLanguage(),
      notifications: (context) => Notifications(),
      fareRate: (context) => FareRate(),
      addRide: (context) => AddRide(),
      editRide: (context) => EditRide(),
      verifyMyID: (context) => VerifyMyID(),
    };
  }
}
