import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/screens/AuthScreen/register_screen.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';
import '../home_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CacheHelper.setData(key: "token", value: state.response['token']);
            RoutesManager.navigatorAndRemove(context, HomeScreen());
          }

          if (state is LoginError) {
            CreatToast().showToast(
              errorMessage: state.errormessage,
              context: context,
            );
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
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
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo'),
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
                              obSecureText: cubit.isPassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              label: "password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changeVisibilty();
                                },
                                icon: Icon(
                                  cubit.visibleicon,
                                  size: 30,
                                  color: greyColor,
                                ),
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text('forget password',
                                style: TextStyle(
                                    color: mainColor,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        state is LoginLoading
                            ? CreatLoading()
                            : CreateButton(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  cubit.login(
                                      value: emailController.text,
                                      password: passwordController.text);
                                },
                                elevation: 0,
                                radius: 40,
                                height: getSize(context: context).height * 0.05,
                                width: getSize(context: context).width * 0.9,
                                bottomMargin: 0,
                                title: 'login',
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don`t have an account?',
                              style: TextStyle(fontFamily: 'Cairo'),
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
                                      context, RegisterScreen());
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
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
        },
      ),
    );
  }
}
