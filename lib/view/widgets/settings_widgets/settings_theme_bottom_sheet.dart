import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
import 'package:quran1/data/constant.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_choose_botton.dart';
class SettingsThemeBottomSheet extends StatelessWidget {
  const SettingsThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(children: [
      InkWell(
        onTap: (){
          provider.changeTheme('light');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( provider.lang == 'en' ? 'light' : 'نهاري',style:provider.appTheme==provider.lightTheme? TextStyle(color: AppColors.primaryColor):null,),
              if(provider.appTheme==provider.lightTheme)
              Icon((Icons.check))
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){
          provider.changeTheme('dark');

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( provider.lang == 'en' ? 'dark' : 'ليلي',style:provider.appTheme==provider.darkTheme? TextStyle(color: AppColors.primaryColor):null,),
              if(provider.appTheme==provider.darkTheme)
                Icon((Icons.check))
            ],
          ),
        ),
      ),

    ],);
  }
}
