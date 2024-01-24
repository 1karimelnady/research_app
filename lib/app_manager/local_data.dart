import 'package:flutter/material.dart';

Size getSize({
  context,
}) {
  Size size = MediaQuery.of(context).size;
  return size;
}

const String baseUrl = "https://educationalapp.onrender.com/api/v1";
const Color mainColor = Color(0xff0563f1);
const Color whiteColor = Colors.white;
const Color greyColor = Color(0xffE0E0E0);
const Color thirdColor = Color(0xffE3E3E3);
