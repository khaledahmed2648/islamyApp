import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran1/data/constant.dart';

import '../../business_logic/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  int currentItem = 0;
  List<String> ayat = [];

  void loadSura(int suraIndex) async {
    await rootBundle
        .loadString('assets/surafiles/$suraIndex.txt')
        .then((value) {
      print(value);
      ayat = value.split('\n');
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);

    var arg = ModalRoute.of(context)!.settings.arguments as SuraArguments;
    if(ayat.isEmpty){
      loadSura(arg.suraNumber);

    }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                provider.appTheme==provider.lightTheme?'assets/images/homescreen.png':'assets/images/darkhomescreen.png',              ))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
                child: Text(
                  'سورة ${arg.suraName}',
                  style: TextStyle(

                    color:provider.appTheme==provider.lightTheme? Colors.black:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  //
                )),
          ),
          body: ayat.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'بسم الله الرحمن الرحيم',
                      style: TextStyle(

                        color:provider.appTheme==provider.lightTheme? Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      //
                    ),
                    const SizedBox(height: 20,),
                    ListView.builder(
                      shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                    itemCount: ayat.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 12),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              '${ayat[index]} {${index+1}}',
                              style: TextStyle(color:provider.appTheme==provider.lightTheme?Colors.black:Colors.white,fontSize: 18,),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.symmetric(vertical: 8),
                            width: double.infinity,
                            height: 1,
                            color: AppColors.secondaryColor,
                          )
                        ],
                      ),
                    )

          ),
                  ],
                ),
              )
      ),
    );
  }
}

class SuraArguments {
  final String suraName;
  final int suraNumber;

  SuraArguments({required this.suraName, required this.suraNumber});
}
