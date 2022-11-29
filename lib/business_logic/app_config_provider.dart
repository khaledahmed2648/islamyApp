import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran1/data/constant.dart';

class AppConfigProvider extends ChangeNotifier{
  String lang='ar';
  int numOfTasbih=0;
  void addTasbih(){
    numOfTasbih++;
    notifyListeners();
  }
  void clearTasbih(){
    numOfTasbih=0;
    notifyListeners();
  }
  void changeLang(String language){
    if(lang==language){
      return;
    }
    else{
      lang=language;
      notifyListeners();
    }
  }
  String theme='light';
  late ThemeData appTheme=lightTheme;
  ThemeData lightTheme=ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 30) ,

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor:const Color.fromRGBO(183, 147, 95, 1),
        selectedItemColor: Colors.black,
        unselectedItemColor:Colors.white ,

      )
  );

  ThemeData darkTheme=ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30) ,

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor:Colors.white ,

      )
  );

  ThemeData getTheme(String appTheme){
    if(appTheme=='light'){
      return lightTheme;
    }
    else {
      return darkTheme;
    }

  }
  void changeTheme(String theme){
    appTheme=getTheme(theme);
    notifyListeners();
  }

}
