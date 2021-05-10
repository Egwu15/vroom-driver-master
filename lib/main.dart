import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'Auth/SignIn/sign_in.dart';
import 'Locale/Languages/language_cubit.dart';
import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/styles.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
 
  WidgetsFlutterBinding.ensureInitialized();
 

  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  String locale = prefs.getString('locale');
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LanguageCubit(locale)),
  ], child: Phoenix(child: VroomDriver())));
}

class VroomDriver extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(builder: (context, locale) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
          const Locale('pt'),
          const Locale('fr'),
          const Locale('id'),
          const Locale('es'),
          const Locale('tk'),
          const Locale('it'),
          const Locale('sw'),
        ],
        locale: locale,
        theme: appTheme,
        home: SignInUI(),
        routes: PageRoutes().routes(),
      );
    });
  }
}
