import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
class SettingsChooseButton extends StatelessWidget {
  final void Function()? onTap;
  final String chosed;
  const SettingsChooseButton({Key? key,required this.chosed,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: provider.appTheme==provider.lightTheme?Colors.grey[300]:Colors.grey,

          // border: Border.all(width: 1,color: Colors.black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(chosed,style: TextStyle(color:provider.appTheme==provider.lightTheme?Colors.black:Colors.white,fontWeight: FontWeight.bold),),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}
