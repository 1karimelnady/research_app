import 'package:flutter/material.dart';

Size getSize({
  context,
}) {
  Size size = MediaQuery.of(context).size;
  return size;
}

const String baseUrl = "http://188.166.169.124/api/v1/";
const Color mainColor = Color(0xff0563f1);
const Color whiteColor = Colors.white;
const Color greyColor = Color(0xffE0E0E0);
const Color thirdColor = Color(0xffE3E3E3);
