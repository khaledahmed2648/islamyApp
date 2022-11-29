import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran1/business_logic/app_config_provider.dart';
import 'package:quran1/view/widgets/settings_widgets/settings_body.dart';
import 'package:quran1/view/widgets/tasbih_widgets/tasbih.dart';

import '../widgets/hadith_widgets/hadith.dart';
import '../widgets/qur2an_widgets/qur2an.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<Widget> homeBody=[
   Qur2an(),
   Hadith(),
   Tasbih(),
   SettingsBody()
 ];
  int currentItem=0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
              image: AssetImage(
        provider.appTheme==provider.lightTheme?'assets/images/homescreen.png':'assets/images/darkhomescreen.png',
      )
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:const Center(child: Text('إسلامي',)),

        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentItem,
          onTap: (index){
           setState(() {
             currentItem=index;
           });
          },
          // type: BottomNavigationBarType.fixed,
          //   backgroundColor:const Color.fromRGBO(183, 147, 95, 1),
          // selectedItemColor: Colors.black,
          // unselectedItemColor:Colors.white ,
          iconSize: 35,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.book),label: '${AppLocalizations.of(context)!.quran}'),
            BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: '${AppLocalizations.of(context)!.hadith}'),
            BottomNavigationBarItem(icon: Icon(Icons.circle_outlined),label: '${AppLocalizations.of(context)!.tasbih}'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: localFunc(arString:'الإعدادات' , enString: 'settings', provider: provider)),
          ],
        ),
        body: homeBody[currentItem],
      ),
    );
  }
}
