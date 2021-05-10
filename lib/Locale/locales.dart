import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:vroom_driver/Locale/Languages/swahili.dart';
import 'dart:async';

import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'tk': turkish(),
    'it': italian(),
    'sw': swahili(),
  };

  String get myRides {
    return _localizedValues[locale.languageCode]['myRides'];
  }

  String get chats {
    return _localizedValues[locale.languageCode]['chats'];
  }

  String get findARide {
    return _localizedValues[locale.languageCode]['findARide'];
  }

  String get wallet {
    return _localizedValues[locale.languageCode]['wallet'];
  }

  String get more {
    return _localizedValues[locale.languageCode]['more'];
  }

  String get signIn {
    return _localizedValues[locale.languageCode]['signIn'];
  }

  String get phoneNumber {
    return _localizedValues[locale.languageCode]['phoneNumber'];
  }

  String get password {
    return _localizedValues[locale.languageCode]['password'];
  }

  String get login {
    return _localizedValues[locale.languageCode]['login'];
  }

  String get newUser {
    return _localizedValues[locale.languageCode]['newUser'];
  }

  String get signUp {
    return _localizedValues[locale.languageCode]['signUp'];
  }

  String get forgot {
    return _localizedValues[locale.languageCode]['forgot'];
  }

  String get orContinueWith {
    return _localizedValues[locale.languageCode]['orContinueWith'];
  }

  String get facebook {
    return _localizedValues[locale.languageCode]['facebook'];
  }

  String get google {
    return _localizedValues[locale.languageCode]['google'];
  }

  String get firstName {
    return _localizedValues[locale.languageCode]['firstName'];
  }

  String get lastName {
    return _localizedValues[locale.languageCode]['lastName'];
  }

  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }

  String get createPassword {
    return _localizedValues[locale.languageCode]['createPassword'];
  }

  String get signUpNow {
    return _localizedValues[locale.languageCode]['signUpNow'];
  }

  String get alreadyRegistered {
    return _localizedValues[locale.languageCode]['alreadyRegistered'];
  }

  String get verification {
    return _localizedValues[locale.languageCode]['verification'];
  }

  String get enterConfirmationCode {
    return _localizedValues[locale.languageCode]['enterConfirmationCode'];
  }

  String get sentToYouOnYourSms {
    return _localizedValues[locale.languageCode]['sentToYouOnYourSms'];
  }

  String get next {
    return _localizedValues[locale.languageCode]['next'];
  }

  String get englishh {
    return _localizedValues[locale.languageCode]['englishh'];
  }

  String get arabicc {
    return _localizedValues[locale.languageCode]['arabicc'];
  }

  String get frenchh {
    return _localizedValues[locale.languageCode]['frenchh'];
  }

  String get portuguesee {
    return _localizedValues[locale.languageCode]['portuguesee'];
  }

  String get indonesiann {
    return _localizedValues[locale.languageCode]['indonesiann'];
  }

  String get spanishh {
    return _localizedValues[locale.languageCode]['spanishh'];
  }

  String get turkishh {
    return _localizedValues[locale.languageCode]['turkishh'];
  }

  String get italiann {
    return _localizedValues[locale.languageCode]['italiann'];
  }

  String get swahilii {
    return _localizedValues[locale.languageCode]['swahilii'];
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]['changeLanguage'];
  }

  String get selectYourPreferredLanguage {
    return _localizedValues[locale.languageCode]['selectYourPreferredLanguage'];
  }

  String get save {
    return _localizedValues[locale.languageCode]['save'];
  }

  String get typeYourMessage {
    return _localizedValues[locale.languageCode]['typeYourMessage'];
  }

  String get heyDavid {
    return _localizedValues[locale.languageCode]['heyDavid'];
  }

  String get goodTimeToTalk {
    return _localizedValues[locale.languageCode]['goodTimeToTalk'];
  }

  String get heyMate {
    return _localizedValues[locale.languageCode]['heyMate'];
  }

  String get yesTellMe {
    return _localizedValues[locale.languageCode]['yesTellMe'];
  }

  String get whatIsYourRouteFrom {
    return _localizedValues[locale.languageCode]['whatIsYourRouteFrom'];
  }

  String get yeahSure {
    return _localizedValues[locale.languageCode]['yeahSure'];
  }

  String get yesWillReachBy {
    return _localizedValues[locale.languageCode]['yesWillReachBy'];
  }

  String get noChatsToShow {
    return _localizedValues[locale.languageCode]['noChatsToShow'];
  }

  String get confirmRideRequest {
    return _localizedValues[locale.languageCode]['confirmRideRequest'];
  }

  String get locations {
    return _localizedValues[locale.languageCode]['locations'];
  }

  String get pickupLocation {
    return _localizedValues[locale.languageCode]['pickupLocation'];
  }

  String get dropLocation {
    return _localizedValues[locale.languageCode]['dropLocation'];
  }

  String get dateAndTimings {
    return _localizedValues[locale.languageCode]['dateAndTimings'];
  }

  String get date {
    return _localizedValues[locale.languageCode]['date'];
  }

  String get time {
    return _localizedValues[locale.languageCode]['time'];
  }

  String get fareAndSeatConfirmation {
    return _localizedValues[locale.languageCode]['fareAndSeatConfirmation'];
  }

  String get fare {
    return _localizedValues[locale.languageCode]['fare'];
  }

  String get numberOfSeats {
    return _localizedValues[locale.languageCode]['numberOfSeats'];
  }

  String get confirmRequest {
    return _localizedValues[locale.languageCode]['confirmRequest'];
  }

  String get rideSummary {
    return _localizedValues[locale.languageCode]['rideSummary'];
  }

  String get weHopeYouHadAGreatRide {
    return _localizedValues[locale.languageCode]['weHopeYouHadAGreatRide'];
  }

  String get paymentHasBeenDoneVia {
    return _localizedValues[locale.languageCode]['paymentHasBeenDoneVia'];
  }

  String get yourVroomWallet {
    return _localizedValues[locale.languageCode]['yourVroomWallet'];
  }

  String get soHowWasYourExperienceWith {
    return _localizedValues[locale.languageCode]['soHowWasYourExperienceWith'];
  }

  String get leaveAFeedback {
    return _localizedValues[locale.languageCode]['leaveAFeedback'];
  }

  String get submitRating {
    return _localizedValues[locale.languageCode]['submitRating'];
  }

  String get selectNumberOfSeats {
    return _localizedValues[locale.languageCode]['selectNumberOfSeats'];
  }

  String get searchRides {
    return _localizedValues[locale.languageCode]['searchRides'];
  }

  String get doYouHaveAnyReferralCode {
    return _localizedValues[locale.languageCode]['doYouHaveAnyReferralCode'];
  }

  String get addSixDigitReferralCode {
    return _localizedValues[locale.languageCode]['addSixDigitReferralCode'];
  }

  String get iDontHave {
    return _localizedValues[locale.languageCode]['iDontHave'];
  }

  String get cont {
    return _localizedValues[locale.languageCode]['cont'];
  }

  String get tripsAndFare {
    return _localizedValues[locale.languageCode]['tripsAndFare'];
  }

  String get anyIssueRegardingYour {
    return _localizedValues[locale.languageCode]['anyIssueRegardingYour'];
  }

  String get payment {
    return _localizedValues[locale.languageCode]['payment'];
  }

  String get problemWhilePaying {
    return _localizedValues[locale.languageCode]['problemWhilePaying'];
  }

  String get appUsability {
    return _localizedValues[locale.languageCode]['appUsability'];
  }

  String get anyIssueWhileUsing {
    return _localizedValues[locale.languageCode]['anyIssueWhileUsing'];
  }

  String get account {
    return _localizedValues[locale.languageCode]['account'];
  }

  String get accountInfoChangeDetails {
    return _localizedValues[locale.languageCode]['accountInfoChangeDetails'];
  }

  String get help {
    return _localizedValues[locale.languageCode]['help'];
  }

  String get chooseYourIssue {
    return _localizedValues[locale.languageCode]['chooseYourIssue'];
  }

  String get reviews {
    return _localizedValues[locale.languageCode]['reviews'];
  }

  String get seatsLeft {
    return _localizedValues[locale.languageCode]['seatsLeft'];
  }

  String get request {
    return _localizedValues[locale.languageCode]['request'];
  }

  String get upcomingRides {
    return _localizedValues[locale.languageCode]['upcomingRides'];
  }

  String get rideHistory {
    return _localizedValues[locale.languageCode]['rideHistory'];
  }

  String get seat {
    return _localizedValues[locale.languageCode]['seat'];
  }

  String get message {
    return _localizedValues[locale.languageCode]['message'];
  }

  String get rejected {
    return _localizedValues[locale.languageCode]['rejected'];
  }

  String get rateRider {
    return _localizedValues[locale.languageCode]['rateRider'];
  }

  String get myProfile {
    return _localizedValues[locale.languageCode]['myProfile'];
  }

  String get about {
    return _localizedValues[locale.languageCode]['about'];
  }

  String get personalInfo {
    return _localizedValues[locale.languageCode]['personalInfo'];
  }

  String get profession {
    return _localizedValues[locale.languageCode]['profession'];
  }

  String get seniorArchitect {
    return _localizedValues[locale.languageCode]['seniorArchitect'];
  }

  String get updateInfo {
    return _localizedValues[locale.languageCode]['updateInfo'];
  }

  String get notifications {
    return _localizedValues[locale.languageCode]['notifications'];
  }

  String get termsAndConditions {
    return _localizedValues[locale.languageCode]['termsAndConditions'];
  }

  String get referAndEarn {
    return _localizedValues[locale.languageCode]['referAndEarn'];
  }

  String get rateVroom {
    return _localizedValues[locale.languageCode]['rateVroom'];
  }

  String get logout {
    return _localizedValues[locale.languageCode]['logout'];
  }

  String get davidJohnsonApprovedYour {
    return _localizedValues[locale.languageCode]['davidJohnsonApprovedYour'];
  }

  String get davidJohnsonRejectedYour {
    return _localizedValues[locale.languageCode]['davidJohnsonRejectedYour'];
  }

  String get requestForARide {
    return _localizedValues[locale.languageCode]['requestForARide'];
  }

  String get approved {
    return _localizedValues[locale.languageCode]['approved'];
  }

  String get yourReferralCode {
    return _localizedValues[locale.languageCode]['yourReferralCode'];
  }

  String get shareTheReferralCode {
    return _localizedValues[locale.languageCode]['shareTheReferralCode'];
  }

  String get rideMap {
    return _localizedValues[locale.languageCode]['rideMap'];
  }

  String get riderProfile {
    return _localizedValues[locale.languageCode]['riderProfile'];
  }

  String get rideInfo {
    return _localizedValues[locale.languageCode]['rideInfo'];
  }

  String get viewInMap {
    return _localizedValues[locale.languageCode]['viewInMap'];
  }

  String get startTime {
    return _localizedValues[locale.languageCode]['startTime'];
  }

  String get returnTime {
    return _localizedValues[locale.languageCode]['returnTime'];
  }

  String get carType {
    return _localizedValues[locale.languageCode]['carType'];
  }

  String get vehicleCapacity {
    return _localizedValues[locale.languageCode]['vehicleCapacity'];
  }

  String get airCondition {
    return _localizedValues[locale.languageCode]['airCondition'];
  }

  String get acAvailable {
    return _localizedValues[locale.languageCode]['acAvailable'];
  }

  String get perSeatPerKm {
    return _localizedValues[locale.languageCode]['perSeatPerKm'];
  }

  String get travelDays {
    return _localizedValues[locale.languageCode]['travelDays'];
  }

  String get sendToBank {
    return _localizedValues[locale.languageCode]['sendToBank'];
  }

  String get availableWalletBalance {
    return _localizedValues[locale.languageCode]['availableWalletBalance'];
  }

  String get enterBankInfo {
    return _localizedValues[locale.languageCode]['enterBankInfo'];
  }

  String get accountNumber {
    return _localizedValues[locale.languageCode]['accountNumber'];
  }

  String get accountHolderName {
    return _localizedValues[locale.languageCode]['accountHolderName'];
  }

  String get bankCode {
    return _localizedValues[locale.languageCode]['bankCode'];
  }

  String get enterAmountToTransfer {
    return _localizedValues[locale.languageCode]['enterAmountToTransfer'];
  }

  String get enterAmount {
    return _localizedValues[locale.languageCode]['enterAmount'];
  }

  String get proceed {
    return _localizedValues[locale.languageCode]['proceed'];
  }

  String get termsOfVroom {
    return _localizedValues[locale.languageCode]['termsOfVroom'];
  }

  String get ridePayment {
    return _localizedValues[locale.languageCode]['ridePayment'];
  }

  String get amountDeductedForRide {
    return _localizedValues[locale.languageCode]['amountDeductedForRide'];
  }

  String get referralReward {
    return _localizedValues[locale.languageCode]['referralReward'];
  }

  String get amountAdded {
    return _localizedValues[locale.languageCode]['amountAdded'];
  }

  String get amountRefunded {
    return _localizedValues[locale.languageCode]['amountRefunded'];
  }

  String get ridePaymentRefund {
    return _localizedValues[locale.languageCode]['ridePaymentRefund'];
  }

  String get myWallet {
    return _localizedValues[locale.languageCode]['myWallet'];
  }

  String get totalBalance {
    return _localizedValues[locale.languageCode]['totalBalance'];
  }

  String get addMoney {
    return _localizedValues[locale.languageCode]['addMoney'];
  }

  String get addReferralCode {
    return _localizedValues[locale.languageCode]['addReferralCode'];
  }

  String get rideRequests {
    return _localizedValues[locale.languageCode]['rideRequests'];
  }

  String get rideRequest {
    return _localizedValues[locale.languageCode]['rideRequest'];
  }

  String get passengers {
    return _localizedValues[locale.languageCode]['passengers'];
  }

  String get addRide {
    return _localizedValues[locale.languageCode]['addRide'];
  }

  String get setPickupLocation {
    return _localizedValues[locale.languageCode]['setPickupLocation'];
  }

  String get setDropLocation {
    return _localizedValues[locale.languageCode]['setDropLocation'];
  }

  String get addPickup {
    return _localizedValues[locale.languageCode]['addPickup'];
  }

  String get addDrop {
    return _localizedValues[locale.languageCode]['addDrop'];
  }

  String get rideStartTime {
    return _localizedValues[locale.languageCode]['rideStartTime'];
  }

  String get returnOnSameRoute {
    return _localizedValues[locale.languageCode]['returnOnSameRoute'];
  }

  String get selectTravelDays {
    return _localizedValues[locale.languageCode]['selectTravelDays'];
  }

  String get pricePerKmPerSeat {
    return _localizedValues[locale.languageCode]['pricePerKmPerSeat'];
  }

  String get viewProfile {
    return _localizedValues[locale.languageCode]['viewProfile'];
  }

  String get addresses {
    return _localizedValues[locale.languageCode]['addresses'];
  }

  String get pickupDate {
    return _localizedValues[locale.languageCode]['pickupDate'];
  }

  String get fareToCollect {
    return _localizedValues[locale.languageCode]['fareToCollect'];
  }

  String get pickupTime {
    return _localizedValues[locale.languageCode]['pickupTime'];
  }

  String get seatsRequested {
    return _localizedValues[locale.languageCode]['seatsRequested'];
  }

  String get reject {
    return _localizedValues[locale.languageCode]['reject'];
  }

  String get acceptRequest {
    return _localizedValues[locale.languageCode]['acceptRequest'];
  }

  String get updateRide {
    return _localizedValues[locale.languageCode]['updateRide'];
  }

  String get editRide {
    return _localizedValues[locale.languageCode]['editRide'];
  }

  String get phoneVerification {
    return _localizedValues[locale.languageCode]['phoneVerification'];
  }

  String get government {
    return _localizedValues[locale.languageCode]['government'];
  }

  String get carInfo {
    return _localizedValues[locale.languageCode]['carInfo'];
  }

  String get carBrand {
    return _localizedValues[locale.languageCode]['carBrand'];
  }

  String get carModel {
    return _localizedValues[locale.languageCode]['carModel'];
  }

  String get seatsForPassengers {
    return _localizedValues[locale.languageCode]['seatsForPassengers'];
  }

  String get airConditionerAvailability {
    return _localizedValues[locale.languageCode]['airConditionerAvailability'];
  }

  String get carNumber {
    return _localizedValues[locale.languageCode]['carNumber'];
  }

  String get carColor {
    return _localizedValues[locale.languageCode]['carColor'];
  }

  String get accept {
    return _localizedValues[locale.languageCode]['accept'];
  }

  String get passengerProfile {
    return _localizedValues[locale.languageCode]['passengerProfile'];
  }

  String get addedToBank {
    return _localizedValues[locale.languageCode]['addedToBank'];
  }

  String get cancelledRide {
    return _localizedValues[locale.languageCode]['cancelledRide'];
  }

  String get rateNow {
    return _localizedValues[locale.languageCode]['rateNow'];
  }

  String get rated {
    return _localizedValues[locale.languageCode]['rated'];
  }

  String get pending {
    return _localizedValues[locale.languageCode]['pending'];
  }

  String get past {
    return _localizedValues[locale.languageCode]['past'];
  }

  String get pickUp {
    return _localizedValues[locale.languageCode]['pickUp'];
  }

  String get newRequest {
    return _localizedValues[locale.languageCode]['newRequest'];
  }

  String get cancelled {
    return _localizedValues[locale.languageCode]['cancelled'];
  }

  String get verifyMy {
    return _localizedValues[locale.languageCode]['verifyMy'];
  }

  String get upload {
    return _localizedValues[locale.languageCode]['upload'];
  }

  String get licence {
    return _localizedValues[locale.languageCode]['licence'];
  }

  String get uploadNow {
    return _localizedValues[locale.languageCode]['uploadNow'];
  }
    String get fullName {
    return _localizedValues[locale.languageCode]['fullName'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'id',
        'pt',
        'ar',
        'fr',
        'es',
        'tr',
        'it',
        'sw'
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
