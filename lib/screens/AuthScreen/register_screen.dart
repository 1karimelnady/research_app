import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/common_widget/create_drob_down_button.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_large_drop_down_button.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LanguageProvider? languageProvider;

  // List<String> registerUserType = ["professor", "student", "Researcher"];
  // String userType = "student";

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2060),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        dateController.text =
            DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          print('AuthCubit State: $state');
          if (state is RegisterSuccess) {
            CreatToast().showToast(
              errorMessage: "Register Successfully",
              context: context,
            );
            CacheHelper.setData(key: "type", value: state.response['type']);
            CacheHelper.setData(key: "token", value: state.response['token']);
            if (state.response['type'] == 'student') {
              RoutesManager.navigatorPush(context, LoginScreen());
            } else {
              RoutesManager.navigatorPush(context, LoginScreen());
            }
          } else if (state is RegisterError) {
            CreatToast().showToast(
              errorMessage: state.errormessage,
              context: context,
            );
          }
        },
        builder: (context, state) {
          AuthCubit registerCubit = AuthCubit.get(context);
          return Scaffold(
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
                          height: getSize(context: context).height * 0.25,
                          image: AssetImage('assets/images/36.png'),
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
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
                              label: "Email or Mobile",
                              labelStyle: TextStyle(
                                  color: greyColor, fontFamily: 'Cairo'),
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
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              label: "Name",
                              labelStyle: TextStyle(
                                fontFamily: 'Cairo',
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
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
                              obSecureText: registerCubit.isPassword,
                              label: "password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  registerCubit.changeVisibilty();
                                },
                                icon: Icon(
                                  registerCubit.visibleicon,
                                  size: 30,
                                  color: greyColor,
                                ),
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
                              labelStyle: TextStyle(
                                  color: greyColor, fontFamily: 'Cairo'),
                            ),
                          ],
                        ),
                        CreatLargDropDown(authCubit: AuthCubit.get(context)),
                        SizedBox(
                          height: 10,
                        ),
                        CreateDropDownSmall(authCubit: AuthCubit.get(context)),
                        SizedBox(
                          height: 10,
                        ),
                        CreatTextField(
                          controller: dateController,
                          onSubmit: (value) {
                            setState(() {});
                          },
                          prefixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_outlined,
                              color: mainColor,
                            ),
                          ),
                          label: 'Select Date',
                          labelStyle: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.grey.withOpacity(0.5)),
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoading,
                          builder: (context) => CreateButton(
                            onTap: () {
                              registerCubit.register(
                                name: nameController.text,
                                email: emailController.text,
                                mobile: phoneController.text,
                                password: passwordController.text,
                                birthDate: dateController.text,
                              );
                            },
                            elevation: 0,
                            radius: 40,
                            bottomMargin: 0,
                            height: getSize(context: context).height * 0.05,
                            width: getSize(context: context).width * 0.9,
                            title: 'Register',
                          ),
                          fallback: (BuildContext context) => CreatLoading(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(50, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  RoutesManager.navigatorPush(
                                      context, LoginScreen());
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainColor,
                                      fontFamily: 'Cairo'),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
