import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:research_app/providers/language_provider.dart';

import '../app_manager/local_data.dart';
import '../utilities/text_style.dart';

class CreatTextField extends StatelessWidget {
  final String? label, title, isBlueHintLabel, priceUnit;
  final Function(String val)? onChange;
  final Function(String? val)? onSubmit;
  final String? Function(String? val)? validator;
  final void Function()? onTap;
  final double? width, height, topMargin;
  final Color? fillColor, labelColor, borderColor;
  final TextEditingController? controller;
  final int? maxLines;
  final double? borderWidth;
  final Widget? suffixIcon, prefixIcon;
  final TextAlign? labelDirection;
  final TextStyle? titleStyle,
      labelStyle,
      errorStyle,
      controllerStyle,
      priceUnitStyle;
  final Decoration? decoration;
  BorderRadius? borderRadius;

  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;

  final bool? enable, obSecureText, isIcon, isContact, isLoginDecoration;
  final TextInputType? keyboardType;

  CreatTextField({
    this.borderColor,
    this.label,
    this.borderWidth,
    this.labelDirection,
    this.borderRadius,
    this.onChange,
    this.title,
    this.topMargin,
    this.fillColor,
    this.labelColor,
    this.width,
    this.titleStyle,
    this.labelStyle,
    this.errorStyle,
    this.maxLines,
    this.height,
    this.controller,
    this.icon,
    this.enable,
    this.obSecureText,
    this.keyboardType,
    this.isBlueHintLabel,
    this.isIcon,
    this.controllerStyle,
    this.priceUnit,
    this.prefixIcon,
    this.isLoginDecoration,
    this.priceUnitStyle,
    this.onSubmit,
    this.validator,
    this.suffixIcon,
    this.decoration,
    this.isContact,
    this.inputFormatters,
    this.onTap,
  });

  LanguageProvider? languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Container(
      margin: EdgeInsets.only(top: topMargin ?? 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // textDirection: languageProvider!.isEnglish == true
        //     ? TextDirection.ltr
        //     : TextDirection.rtl,
        children: [
          title == null
              ? SizedBox()
              : Text(
                  title ?? "",
                  style: titleStyle ??
                      MainTitle.display5(context).copyWith(color: Colors.black),
                ),
          // Directionality(
          //   textDirection: languageProvider!.isEnglish == true
          //       ? TextDirection.ltr
          //       : TextDirection.rtl,
          Container(
            margin: EdgeInsets.only(top: title == null ? 0 : 5.0),
            // height: height ?? getSize(context: context).height * 0.04,
            width: width ?? getSize(context: context).width * 0.7,
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
            child: TextFormField(
              onTap: onTap,
              enabled: enable,
              obscureText: obSecureText ?? false,
              textDirection: TextDirection.ltr,
              // languageProvider!.isEnglish == true
              //     ? TextDirection.ltr
              //     : TextDirection.rtl,
              textAlign: TextAlign.left //labelDirection == null
              //     ? languageProvider!.isEnglish == true
              // ? TextAlign.left
              // : TextAlign.right
              //: labelDirection!,
              ,
              inputFormatters: inputFormatters,
              textAlignVertical: TextAlignVertical.center,
              maxLines: maxLines ?? 1,
              // maxLines: maxLines,
              onFieldSubmitted: onSubmit,
              onChanged: onChange,
              validator: validator,
              keyboardType: keyboardType,
              controller: controller,
              style: controllerStyle ??
                  BlackTitle.display5(context).copyWith(color: mainColor),
              decoration: InputDecoration(
                // isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                // filled: true,
                // fillColor: fillColor ?? Colors.white,
                hintText: (label ?? " "),
                hintStyle: labelStyle ??
                    TextStyle(
                        fontSize: 12, color: mainColor, fontFamily: "Cairo"),
                errorStyle: errorStyle,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 0.0,
                  ),
                  child: suffixIcon,
                ),
                prefixIcon: prefixIcon,
                // enabledBorder:  OutlineInputBorder(
                //     borderSide: BorderSide(
                //         color: borderColor ?? mainColor,
                //         width: borderWidth ?? 0.6),
                //     borderRadius:
                //         borderRadius ?? BorderRadius.all(Radius.circular(8))),
                // disabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //         color: borderColor ?? mainColor,
                //         width: borderWidth ?? 0.6),
                //     borderRadius:
                //         borderRadius ?? BorderRadius.all(Radius.circular(8))),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //         color: borderColor ?? mainColor,
                //         width: borderWidth ?? 1.0),
                //     borderRadius:
                //         borderRadius ?? BorderRadius.all(Radius.circular(8.0))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
