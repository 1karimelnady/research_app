import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/screens/AuthScreen/register_screen.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  LanguageProvider? languageProvider;

  List<String> loginUserType = ["professor", "student"];

  String userType = "student";

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return Scaffold(
      // backgroundColor: mainColor.withOpacity(0.1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: getSize(context: context).height * 0.30,
                    image: AssetImage(
                        'assets/images/istockphoto-1281150061-612x612.jpg'),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.alternate_email_rounded,
                        size: 30,
                        color: greyColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CreatTextField(
                        // width: double.infinity,
                        controller: emailController,
                        label: "Email ID",
                        labelStyle: TextStyle(
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                        size: 30,
                        color: greyColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CreatTextField(
                        // width: double.infinity,
                        controller: passwordController,
                        label: "password",
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          size: 30,
                          color: greyColor,
                        ),
                        labelStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text('forget password',
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  // Container(
                  //   child: RadioListTile(
                  //     fillColor: MaterialStateProperty.all(mainColor),
                  //     visualDensity: VisualDensity(
                  //         vertical: -4,
                  //         horizontal:
                  //             -4), // Adjust the size of the radio button
                  //
                  //     title: Text(
                  //       "professor",
                  //       style: BlackTitle.display5(context)
                  //           .copyWith(color: Color(0xff666666)),
                  //     ),
                  //     value: loginUserType[0],
                  //     groupValue: userType,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         userType = value!;
                  //       });
                  //       print("userType : $userType");
                  //     },
                  //   ),
                  // ),
                  // Container(
                  //     child: RadioListTile(
                  //   fillColor: MaterialStateProperty.all(mainColor),
                  //   visualDensity: VisualDensity(
                  //       vertical: -4,
                  //       horizontal: -4), // Adjust the size of the radio button
                  //
                  //   title: Text(
                  //     "student",
                  //     style: BlackTitle.display5(context).copyWith(
                  //       color: Color(0xff666666),
                  //     ),
                  //   ),
                  //   value: loginUserType[1],
                  //   groupValue: userType,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       userType = value!;
                  //     });
                  //     print("userType : $userType");
                  //   },
                  // )),
                  CreateButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        if (emailController.text.trim().isEmpty) {
                          CreatToast().showToast(
                              // backgroundColor: Colors.orange,
                              errorMessage: "Email is required",
                              context: context);
                        } else if (passwordController.text.trim()!.isEmpty) {
                          CreatToast().showToast(
                              // backgroundColor: Color(0xffF69521),
                              errorMessage: "password is required",
                              context: context);
                        } else if (passwordController.text.trim().length < 8) {
                          CreatToast().showToast(
                              // backgroundColor: Color(0xffF69521),
                              errorMessage: "password must not less than 8",
                              context: context);
                        }
                      }
                    },
                    elevation: 0,
                    radius: 40,
                    height: getSize(context: context).height * 0.05,
                    width: getSize(context: context).width * 0.9,
                    bottomMargin: 0,
                    title: 'login',
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       height: 1,
                  //       width: getSize(context: context).width * 0.35,
                  //       color: Colors.grey,
                  //     ),
                  //     Text('OR'),
                  //     Container(
                  //       height: 1,
                  //       width: getSize(context: context).width * 0.35,
                  //       color: Colors.grey,
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       color: mainColor.withOpacity(0.1),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image(
                  //           width: getSize(context: context).width * 0.05,
                  //           height: getSize(context: context).height * 0.06,
                  //           image: AssetImage('assets/images/google.png'),
                  //         ),
                  //         MaterialButton(
                  //           onPressed: () {},
                  //           child: Text(
                  //             "Login With Google",
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t have an account?'),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          onPressed: () {
                            RoutesManager.navigatorPush(
                                context, RegisterScreen());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: mainColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
