import 'package:flutter/material.dart';
import 'package:quran1/view/widgets/tasbih_widgets/tasbih_logo.dart';
class Tasbih extends StatelessWidget {
  const Tasbih({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TasbihLogo(),


        ],
      ),
    );
  }
}
