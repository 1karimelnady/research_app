// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
// import 'package:research_app/cubit/main_cubit.dart';
// import '../app_manager/local_data.dart';
// import '../providers/language_provider.dart';
// import '../utilities/cache_helper.dart';
// import '../utilities/text_style.dart';
// import 'package:flutter/material.dart';
//
// class CreatLargDropDown extends StatefulWidget {
//   final AuthCubit authCubit;
//   const CreatLargDropDown({Key? key, required this.authCubit})
//       : super(key: key);
//
//   @override
//   State<CreatLargDropDown> createState() => _CreatLargDropDownState();
// }
//
// class _CreatLargDropDownState extends State<CreatLargDropDown> {
//   LanguageProvider? languageProvider;
//
//   List<String> usertype = [];
//   bool visibility = false;
//   String? startedItem;
//
//   @override
//   void initState() {
//     languageProvider = Provider.of<LanguageProvider>(context, listen: false);
//     usertype = [
//       "student",
//       "researcher",
//       "professor",
//     ];
//     startedItem = "student";
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //  languageProvider = Provider.of<LanguageProvider>(context, listen: true);
//
//     return Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "choose",
//             style: MainTitle.display5(context),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 visibility = !visibility;
//               });
//             },
//             child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.7, color: mainColor),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(6.0),
//                     topLeft: Radius.circular(6.0),
//                     bottomRight: visibility == false
//                         ? Radius.circular(6.0)
//                         : Radius.circular(0.0),
//                     bottomLeft: visibility == false
//                         ? Radius.circular(6.0)
//                         : Radius.circular(0.0),
//                   ),
//                   color: Colors.transparent,
//                 ),
//                 padding: EdgeInsets.all(5),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         startedItem ?? "choose",
//                         style:
//                             GreyTitle.display5(context).copyWith(fontSize: 14),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down_sharp,
//                       size: 28,
//                       color: mainColor,
//                     ),
//                   ],
//                 )),
//           ),
//           Visibility(
//               visible: visibility,
//               child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(width: 0.7, color: mainColor),
//                   ),
//                   child: Column(
//                       children: List.generate(
//                           3,
//                           (index) => InkWell(
//                                 onTap: () {
//                                   FocusScope.of(context).unfocus();
//                                   CacheHelper.setData(
//                                       key: "type",
//                                       value: index == 0
//                                           ? "student"
//                                           : index == 1
//                                               ? "researcher"
//                                               : "professor");
//                                   setState(() {
//                                     visibility = !visibility;
//                                     if (index == 0) {
//                                       startedItem = usertype[index];
//                                     } else {
//                                       startedItem = usertype[index];
//                                     }
//                                   });
//                                   widget.authCubit
//                                       .saveUserType(type: usertype[index]);
//                                   // BlocProvider.of<MainCubit>(context)
//                                   //     .saveUserType(
//                                   //         type: index == 0
//                                   //             ? "student"
//                                   //             : index == 1
//                                   //                 ? "researcher"
//                                   //                 : "professor");
//                                 },
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 5),
//                                   child: Column(
//                                     children: [
//                                       Text(usertype[index],
//                                           style: MainTitle.display5(context)
//                                               .copyWith(fontSize: 13)),
//                                       // Divider(
//                                       //   color: mainColor,
//                                       //   height: 1,
//                                       //   indent: 10,
//                                       //   endIndent: 10,
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               )))))
//         ],
//       ),
//     );
//   }
// }
