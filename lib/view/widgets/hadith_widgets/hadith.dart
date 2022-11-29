import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran1/data/constant.dart';
import 'package:quran1/view/screens/hadeth_details_screen.dart';

import '../general_widgets/general_text.dart';
import 'hadith_logo.dart';

class Hadith extends StatefulWidget {
  Hadith({Key? key}) : super(key: key);

  @override
  State<Hadith> createState() => _HadithState();
}

class _HadithState extends State<Hadith> {
  List<String> ahadithTitle = [];

  List<String> ahadithContent = [];
  List<String> ahadith = [];

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String content = '';
      String fileContent =
          await rootBundle.loadString('assets/hadithfiles/h$i.txt');
      List<String> lines = fileContent.split('\n');
      ahadithTitle.add(lines[0]);
      for (int l = 1; l < 2; l++) {
        content += fileContent.split('\n')[l];
      }
      ahadithContent.add(content);
      print(ahadithContent.length);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ahadithTitle.isEmpty) {
      loadHadithFile();
    }
    return ahadithTitle.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HadethLogo(),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)
                  ),
                    child: Text(
                  'الأحاديث',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ahadithTitle.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'hadethdetailsscreen',
                          arguments: HadethArguments(
                              HadethName: ahadithTitle[index],
                              HadethContent: ahadithContent[index]));
                    },
                    child: Column(
                      children: [
                        GeneralTextOfList(text: ahadithTitle[index]),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          width: double.infinity,
                          height: 1,
                          color: AppColors.secondaryColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
