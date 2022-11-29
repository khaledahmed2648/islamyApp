import 'package:flutter/material.dart';
import 'package:quran1/data/constant.dart';

import '../general_widgets/general_text.dart';

class LabelItemOfList extends StatelessWidget {
  final String label;
  double? topBorderWidth;
  double? rightBorderWidth;
  double? leftBorderWidth;
  double? bottomBorderWidth;

  LabelItemOfList(
      {Key? key,
      required this.label,
      this.bottomBorderWidth,
      this.leftBorderWidth,
      this.rightBorderWidth,
      this.topBorderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      child: GeneralTextOfList(
    text: label,
      ),
    );
  }
}
