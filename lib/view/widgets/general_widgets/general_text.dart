import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';

class GeneralTextOfList extends StatelessWidget {
  final String text;

  const GeneralTextOfList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        text,
        style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
          color:provider.appTheme==provider.lightTheme? Colors.black:Colors.white,

        ),
      ),
    );
  }
}
