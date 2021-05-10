import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Locale/Languages/language_cubit.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Theme/colors.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  LanguageCubit _languageCubit;
  int _languageValue;

  @override
  void initState() {
    super.initState();
    _languageValue = 0;
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    final List<String> languages = [
      locale.englishh,
      locale.arabicc,
      locale.frenchh,
      locale.portuguesee,
      locale.indonesiann,
      locale.spanishh,
      locale.turkishh,
      locale.italiann,
      locale.swahilii,
    ];
    return Scaffold(
      backgroundColor: entryFieldColor,
      appBar: AppBar(
        title: Text(
          locale.changeLanguage.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    locale.selectYourPreferredLanguage,
                    style: theme.textTheme.subtitle2.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: languages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 4,
                        color: Color(0xffE7EAEC),
                      ),
                      RadioListTile(
                        activeColor: theme.primaryColor,
                        value: index,
                        groupValue: _languageValue,
                        onChanged: (value) {
                          setState(() {
                            _languageValue = value;
                          });
                        },
                        title: Text(
                          languages[index],
                          style:
                              theme.textTheme.subtitle1.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 4,
                  color: Color(0xffE7EAEC),
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: GestureDetector(
                onTap: () async {
                  var prefs = await SharedPreferences.getInstance();

                  if (languages[_languageValue] == locale.englishh) {
                    prefs.setString('locale', 'en');
                    _languageCubit.selectEngLanguage();
                  } else if (languages[_languageValue] == locale.arabicc) {
                    prefs.setString('locale', 'ar');
                    _languageCubit.selectArabicLanguage();
                  } else if (languages[_languageValue] == locale.portuguesee) {
                    prefs.setString('locale', 'pt');
                    _languageCubit.selectPortugueseLanguage();
                  } else if (languages[_languageValue] == locale.frenchh) {
                    prefs.setString('locale', 'fr');
                    _languageCubit.selectFrenchLanguage();
                  } else if (languages[_languageValue] == locale.spanishh) {
                    prefs.setString('locale', 'es');
                    _languageCubit.selectSpanishLanguage();
                  } else if (languages[_languageValue] == locale.indonesiann) {
                    prefs.setString('locale', 'in');
                    _languageCubit.selectIndonesianLanguage();
                  } else if (languages[_languageValue] == locale.italiann) {
                    prefs.setString('locale', 'it');
                    _languageCubit.selectItalianLanguage();
                  } else if (languages[_languageValue] == locale.swahilii) {
                    prefs.setString('locale', 'sw');
                    _languageCubit.selectSwahiliLanguage();
                  } else if (languages[_languageValue] == locale.turkishh) {
                    prefs.setString('locale', 'tk');
                    _languageCubit.selectTurkishLanguage();
                  }

                  Navigator.pop(context);
                },
                child: CustomButton(
                  label: locale.save,
                  labelStyle: theme.textTheme.headline6,
                  height: 50,
                ),
              ),
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
