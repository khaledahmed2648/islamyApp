import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
import 'package:quran1/view/screens/hadeth_details_screen.dart';
import 'package:quran1/view/screens/homescreen.dart';
import 'package:quran1/view/screens/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp( ChangeNotifierProvider<AppConfigProvider>(
      create: (context)=>AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return  MaterialApp(
      theme: provider.appTheme,
     debugShowCheckedModeBanner: false,
      initialRoute: 'homescreen',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:AppLocalizations.supportedLocales,
     locale: Locale(provider.lang),
      routes: {
       'homescreen':(context)=>const HomeScreen(),
        'suradetailsscreen':(context)=>const SuraDetailsScreen(),
        'hadethdetailsscreen':(context)=>const HadethDetailsScreen()

      },
       );
  }
}

