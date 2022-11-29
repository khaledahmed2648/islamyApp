import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/data/constant.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_choose_botton.dart';

import '../../../business_logic/app_config_provider.dart';
class SettingsLangBottomSheet extends StatelessWidget {
  const SettingsLangBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Column(children: [
      InkWell(
        onTap: (){
          provider.changeLang('en');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('English',style:provider.lang=='en'? TextStyle(color: AppColors.primaryColor):null,),
              if(provider.lang=='en')Icon(Icons.check)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){
          provider.changeLang('ar');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('العربية',style:provider.lang=='ar'? TextStyle(color: AppColors.primaryColor):null),
              if(provider.lang=='ar')Icon(Icons.check)
            ],
          ),
        ),
      ),

    ],);
  }
}
