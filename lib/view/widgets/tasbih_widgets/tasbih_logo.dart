import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
import 'package:quran1/data/constant.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_body.dart';

class TasbihLogo extends StatefulWidget {
  const TasbihLogo({Key? key}) : super(key: key);

  @override
  State<TasbihLogo> createState() => _TasbihLogoState();
}

class _TasbihLogoState extends State<TasbihLogo> {
  @override
  Widget build(BuildContext context) {
    int tasbih=0;
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 250,
              width: 300,
            ),
            Positioned(
                top: 0,
                left: 130,
                height: 90,
                width: 100,
                child: Image.asset(provider.appTheme == provider.darkTheme
                    ? 'assets/images/head_sebha_dark.png'
                    : 'assets/images/head_sebha_logo.png')),
            Positioned(
                top: 70,
                left: 80,
                height: 150,
                width: 150,
                child: Image.asset(provider.appTheme == provider.darkTheme
                    ? 'assets/images/body_sebha_dark.png'
                    : 'assets/images/body_sebha_logo.png')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              localFunc(
                  arString: 'عدد التسبيحات',
                  enString: 'Number of tasbeeh',
                  provider: provider),
              style: TextStyle(
                color: provider.appTheme == provider.lightTheme
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20) ,
              color: provider.appTheme == provider.lightTheme
    ? AppColors.primaryColor
        : Colors.black.withOpacity(.3),
            ),

            height: 70,
              width: 100,
            child: Center(
              child: Text(
                '${provider.numOfTasbih}', style: TextStyle(color:provider.appTheme==provider.lightTheme?Colors.black:Colors.white,fontSize: 18,),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            provider.addTasbih();

            setState(() {
            });
          },
          child: Container(
            height: 60,
            width: 200,
            padding: const EdgeInsets.all( 5.0),
            margin: const EdgeInsets.all( 15.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30) ,
              color: provider.appTheme == provider.lightTheme
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
            ),
            child: Center(

              child: Text(
                localFunc(
                    arString: 'سبحان الله',
                    enString: 'سبحان الله',
                    provider: provider),
                style: TextStyle(
                  color: provider.appTheme == provider.lightTheme
                      ? Colors.white
                      : Colors.black ,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            provider.clearTasbih();


          },
          child: Container(
            height: 60,
            width: 200,
            padding: const EdgeInsets.all( 5.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30) ,
              color: provider.appTheme == provider.lightTheme
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
            ),
            child: Center(

              child: Text(
                localFunc(
                    arString: 'إعادة',
                    enString: 'return',
                    provider: provider),
                style: TextStyle(
                  color: provider.appTheme == provider.lightTheme
                      ? Colors.white
                      : Colors.black ,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
