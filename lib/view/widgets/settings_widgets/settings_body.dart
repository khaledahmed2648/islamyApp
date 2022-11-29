import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_choose_botton.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_lang_bottom_sheet.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_theme_bottom_sheet.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(localFunc(
              arString: 'اللغة', enString: 'language', provider: provider),
            style: TextStyle(color: provider.appTheme == provider.lightTheme
                ? Colors.black
                : Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.start,),
          SizedBox(height: 10,),
          SettingsChooseButton(
              chosed: provider.lang == 'en' ? 'English' : 'العربية', onTap: () {
            showModalBottomSheet(context: context,
                builder: (context) => SettingsLangBottomSheet());
          }),
          SizedBox(height: 10,),
          Text(
            localFunc(arString: 'الوضع', enString: 'theme', provider: provider),
            style: TextStyle(color: provider.appTheme == provider.lightTheme
                ? Colors.black
                : Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.start,),
          SizedBox(height: 10,),
          SettingsChooseButton(
              chosed: provider.appTheme == provider.lightTheme ? localFunc(
                  arString: 'نهاري', enString: 'light', provider: provider):
              localFunc(arString: 'ليلي', enString: 'dark', provider: provider),
              onTap: () {
                showModalBottomSheet(context: context,
                    builder: (context) =>const SettingsThemeBottomSheet());
              }),

        ],
      ),
    );
  }
}

String localFunc(
    {required String arString, required String enString, required AppConfigProvider provider}) {
  if (provider.lang == 'en') {
    return enString;
  }
  else
    return arString;
}
