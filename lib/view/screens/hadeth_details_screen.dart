import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
import 'package:quran1/data/constant.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    var arg = ModalRoute.of(context)!.settings.arguments as HadethArguments;
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                provider.appTheme==provider.lightTheme?'assets/images/homescreen.png':'assets/images/darkhomescreen.png',
              ))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
                child: Text(
                  ' ${arg.HadethName}',
              style: TextStyle(
                color:provider.appTheme==provider.lightTheme? Colors.black:Colors.white,

                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              //
            )),
          ),
          body:ListView(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Center(
                child: Text(textAlign: TextAlign.center,arg.HadethContent,style: TextStyle(
                    color:provider.appTheme==provider.lightTheme? Colors.black:Colors.white,
                    fontSize: 25,height: 2),),
                  ),
              )
            ],
          ),
      ),
    );
  }
}

class HadethArguments {
  final String HadethName;
  final String HadethContent;

  HadethArguments({required this.HadethName, required this.HadethContent});
}
