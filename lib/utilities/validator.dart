// class Validator {
//   // static String? validateEmail(String? value) {
//   //   //   value.trim();
//   //    var pattern =
//   //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//   //       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//   //       r"{0,253}[a-zA-Z0-9])?)*$";
//   //   RegExp regex = new RegExp(pattern);
//   //   if (!regex.hasMatch(value!) || value.isEmpty == true)
//   //     return 'من فضلك ادخل الايميل صحيح';
//   //   else
//   //     return null;
//   // }
//   //
//
//
//
//   static String? validateConfirmPassword(
//       String password, String confirmPassword) {
//     if (password != confirmPassword) {
//       return "كلمه المرور غير متطابقه";
//     } else {
//       return null;
//     }
//   }
//
//
//
//
//   // static String? validatePhone(String value) {
//   //   // value.trim();
//   //   if (value.length >= 10)
//   //     return 'رقم الهاتف غير صحيح';
//   //   else
//   //     return null;
//   // }
//   static String? validatePhone(String value) {
//
//     if (
//     value.length < 8 ||value.length >12||
//       value.isEmpty)
//      { return 'رقم الهاتف غير صحيح';}
//     else
//       {return null;}
//   }
//   static String? validatePassword(String value) {
//     if (value.length < 6 ) {
//       return 'كلمه المرور يجب ان لا تقل عن 6 احرف ';
//     } else {
//       return null;
//     }
//   }
//
//   // static String? validateName(String value) {
//   //   // value.isEmpty == true || value == null &&
//   //   // value.trim();
//   //   if (value.length > 10 && value.isEmpty == false ) {
//   //     return 'الاسم لا يجب ان  يزيد عن عشره احرف';
//   //   } else {
//   //     return null;
//   //   }
//   // }
//   //
//   // static String? validateAdsTitle(String value) {
//   //   if (value.length > 30) {
//   //     return 'عنران الاعلان يجب الا يزيد عن ثلاثه وعشرون احرف ';
//   //   } else {
//   //     return null;
//   //   }
//   // }
//
//   // static String? validateAdsDescription(String value) {
//   //   if (value.length > 500) {
//   //     return 'تفاصيل الاعلان يجب الا تزيد عن ٥٠٠ حرف ';
//   //   } else {
//   //     return null;
//   //   }
//   // }
//   static String? validateServerLink(String value) {
//     if (value.isEmpty==true ) {
//       return 'من فضلك ادخل عنوان الخادم';
//     } else {
//       return null;
//     }
//   }
//
//
//   static String? validateLicenses(String value) {
//
//
//        var pattern =
//
//      r"^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$";
//
//     RegExp regex = new RegExp(pattern);
//
//
//
//
//
//     if (!regex.hasMatch(value) || value.isEmpty == true) {
//       return 'من فضلك تاكد من رمز التدخيل الذى ادخلته';
//     } else {
//       return null;
//     }
//   }
//   static String? completeData(String value) {
//     if (value.isEmpty==true ) {
//       return "من فضلك تأكد من بياناتك";
//     } else {
//       return null;
//     }
//   }
//
//
//
//  //  static String? validateQuantity(String value) {
//  //    RegExp _regExp = RegExp(r'^[0-9]+$');
//  //
//  //    if (_regExp.hasMatch(value)){ return "لا يمكنك الكتابه بالغه العربيه";}
//  // else
//  //     { return null;}
//  //  }
//
//
//
//
// }
