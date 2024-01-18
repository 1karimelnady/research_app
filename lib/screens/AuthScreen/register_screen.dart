import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LanguageProvider? languageProvider;

  List<String> registerUserType = ["professor", "student"];

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
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/36.png'),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold),
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
                        keyboardType: TextInputType.emailAddress,
                        label: "Email ID",
                        labelStyle:
                            TextStyle(color: greyColor, fontFamily: 'Cairo'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: greyColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CreatTextField(
                        controller: firstNameController,
                        keyboardType: TextInputType.text,
                        label: "First Name",
                        labelStyle: TextStyle(
                          fontFamily: 'Cairo',
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: greyColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CreatTextField(
                        controller: lastNameController,
                        keyboardType: TextInputType.text,
                        label: "Last Name",
                        labelStyle:
                            TextStyle(color: greyColor, fontFamily: 'Cairo'),
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
                        labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.grey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: greyColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CreatTextField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        label: "Mobile",
                        labelStyle:
                            TextStyle(color: greyColor, fontFamily: 'Cairo'),
                      ),
                    ],
                  ),
                  Container(
                    child: RadioListTile(
                      fillColor: MaterialStateProperty.all(mainColor),
                      visualDensity: VisualDensity(
                          vertical: -4,
                          horizontal:
                              -4), // Adjust the size of the radio button

                      title: Text(
                        "professor",
                        style: BlackTitle.display5(context)
                            .copyWith(color: Color(0xff666666)),
                      ),
                      value: registerUserType[0],
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value!;
                        });
                        print("userType : $userType");
                      },
                    ),
                  ),
                  Container(
                      child: RadioListTile(
                    fillColor: MaterialStateProperty.all(mainColor),
                    visualDensity: VisualDensity(
                        vertical: -4,
                        horizontal: -4), // Adjust the size of the radio button

                    title: Text(
                      "student",
                      style: BlackTitle.display5(context).copyWith(
                        color: Color(0xff666666),
                      ),
                    ),
                    value: registerUserType[1],
                    groupValue: userType,
                    onChanged: (value) {
                      setState(() {
                        userType = value!;
                      });
                      print("userType : $userType");
                    },
                  )),
                  CreateButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (emailController.text.trim().isEmpty) {
                          CreatToast().showToast(
                              // backgroundColor: Colors.orange,
                              errorMessage: "Email is required",
                              context: context);
                        } else if (firstNameController.text.trim().isEmpty) {
                          CreatToast().showToast(
                              // backgroundColor: Colors.orange,
                              errorMessage: "First name is required",
                              context: context);
                        } else if (lastNameController.text.trim().isEmpty) {
                          CreatToast().showToast(
                              // backgroundColor: Colors.orange,
                              errorMessage: "Last name is required",
                              context: context);
                        } else if (passwordController.text.trim().isEmpty) {
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
                      } else if (phoneController.text.trim().isEmpty) {
                        CreatToast().showToast(
                            errorMessage: "phone number is required",
                            context: context);
                      } else if (phoneController.text.trim().length < 11 ||
                          phoneController.text.trim().length > 12) {
                        CreatToast().showToast(
                            errorMessage: "phone number not correct",
                            context: context);
                      } else {}
                    },
                    elevation: 0,
                    radius: 40,
                    bottomMargin: 0,
                    height: getSize(context: context).height * 0.05,
                    width: getSize(context: context).width * 0.9,
                    title: 'Register',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                      ),
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
                            RoutesManager.navigatorPush(context, LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                                fontFamily: 'Cairo'),
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
