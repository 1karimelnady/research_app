import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

class CreateButton extends StatelessWidget {
  LanguageProvider? languageProvider;
  String? title;

  double? width, height, topMargin, bottomMargin;
  Color? backGround;
  double? elevation;
  double? radius;
  Color? colorBorder;
  TextStyle? titleStyle;
  double? widthBorder;
  void Function()? onTap;

  CreateButton(
      {this.height,
      this.topMargin,
      this.colorBorder,
      this.widthBorder,
      this.radius,
      this.titleStyle,
      required this.title,
      this.backGround,
      this.onTap,
      this.width,
      this.elevation,
      this.bottomMargin});

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
      onTap: onTap,
      child: Card(
        margin:
            EdgeInsets.only(top: topMargin ?? 15, bottom: bottomMargin ?? 15),
        elevation: elevation ?? 5,
        color: backGround ?? mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          alignment: Alignment.center,
          height: height ?? 35,
          width: width ?? getSize(context: context).width * 0.7,
          decoration: BoxDecoration(
              color: backGround ?? mainColor,
              border: Border.all(
                  color: colorBorder ?? mainColor, width: widthBorder ?? 1.5),
              borderRadius: BorderRadius.circular(radius ?? 5)),
          child: Text(title!,
              textAlign: TextAlign.center,
              style: titleStyle ?? WhiteTitle.display5(context)),
        ),
      ),
    );
  }
}
