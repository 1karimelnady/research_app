import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:toast/toast.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  LanguageProvider? languageProvider;
  // void requestspermission() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   NotificationSettings notificationSettings =
  //       await messaging.requestPermission(
  //           alert: true,
  //           announcement: true,
  //           badge: true,
  //           carPlay: true,
  //           criticalAlert: true,
  //           provisional: true,
  //           sound: true);
  //   if (notificationSettings.authorizationStatus ==
  //       AuthorizationStatus.authorized) {
  //     print('ok authorized');
  //   } else if (notificationSettings.authorizationStatus ==
  //       AuthorizationStatus.authorized) {
  //     print('ok authorized');
  //   } else {
  //     print('user denied ');
  //   }
  // }

  // void requestNotificationPermission() async {
  //   // print('karim');
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  // }
  //
  // @override

  // requestpermission() async {
  //   await Permission.notification.isDenied.then((value) {
  //     if (value) {
  //       ToastContext().init(context);
  //       Toast.show(
  //         '${Permission.notification.request()}',
  //         textStyle: TextStyle(fontSize: 18, color: Colors.white),
  //         duration: Toast.lengthLong,
  //         gravity: Toast.center,
  //         backgroundRadius: 10,
  //         backgroundColor: mainColor,
  //       );
  //
  //       print("gggggggggggggggggggggggggggggggg$value");
  //       print("kkkkkkkkkkkkkkkkkkkkkkkkkk");
  //     }
  //   });
  // }
  // Future<void> requestPermission() async {
  //   final permission = Permission.accessNotificationPolicy;
  //
  //   if (await permission.isDenied) {
  //     await permission.request();
  //   }
  // }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CacheHelper.setData(key: "token", value: state.response['token']);
            RoutesManager.navigatorAndRemove(context, const HomeScreen());
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
                          image: const AssetImage(
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
                            const Icon(
                              Icons.alternate_email_rounded,
                              size: 30,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CreatTextField(
                              validator: (value) {
                                // if (value!.isEmpty) {
                                //   return "Email or Mobile is required";
                                // }
                              },
                              controller: emailController,
                              label: "Email ID",
                              labelStyle: const TextStyle(
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              size: 30,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CreatTextField(
                              validator: (value) {
                                // if (value!.isEmpty) {
                                //   return "Password";
                                // }
                              },
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
                            child: const Text('forget password',
                                style: TextStyle(
                                    color: mainColor,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        state is LoginLoading
                            ? const CreatLoading()
                            : CreateButton(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (formKey.currentState!.validate()) {
                                    if (emailController.text.isEmpty) {
                                      CreatToast().showToast(
                                        errorMessage:
                                            "Email or Mobile is required",
                                        context: context,
                                      );
                                    } else if (passwordController
                                        .text.isEmpty) {
                                      CreatToast().showToast(
                                        errorMessage: "Password is required",
                                        context: context,
                                      );
                                    } else if (passwordController.text.length <
                                        8) {
                                      CreatToast().showToast(
                                        errorMessage:
                                            "Password must not less than 8",
                                        context: context,
                                      );
                                    } else {
                                      cubit.login(
                                          value: emailController.text,
                                          password: passwordController.text);
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
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don`t have an account?',
                              style: TextStyle(fontFamily: 'Cairo'),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(50, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  RoutesManager.navigatorPush(
                                      context, const RegisterScreen());
                                },
                                child: const Text(
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
