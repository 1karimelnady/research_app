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
import '../professor_screen/professor_home_screen.dart';
import '../researcher_screen/researcher_home_screen.dart';
import '../student_screen/studenthomescreen.dart';

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

  @override
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
            CreatToast().showToast(
                errorMessage: "LoginSuccessfully",
                context: context,
                backgroundColor: mainColor);
            String name = state.response['name'];
            CacheHelper.setData(key: "type", value: state.response['type']);
            CacheHelper.setData(key: "token", value: state.response['token']);
            String userType = CacheHelper.getData(key: "type") ?? "";
            if (userType == "professor") {
              RoutesManager.navigatorAndRemove(
                  context, ProfessorHomeSCreen(name: name));
            } else if (userType == "researcher") {
              RoutesManager.navigatorAndRemove(context, ResearcherHomeScreen());
            } else if (userType == "student") {
              RoutesManager.navigatorAndRemove(context, StudentHomeScreen());
            }
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
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: getSize(context: context).height * 0.30,
                          image: const AssetImage(
                            'assets/images/istockphoto-1281150061-612x612.jpg',
                          ),
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo'),
                        ),
                        const SizedBox(
                          height: 10,
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
                                if (value!.isEmpty) {
                                  return "Email or Mobile is required";
                                }
                                return null;
                              },
                              controller: emailController,
                              label: "Email or Mobile",
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
                                if (value!.isEmpty) {
                                  return "Password is required";
                                }
                                return null;
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
                        const SizedBox(
                          height: 20,
                        ),
                        state is LoginLoading
                            ? const CreatLoading()
                            : CreateButton(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(
                                        value: emailController.text,
                                        password: passwordController.text);

                                    // if (emailController.text.isEmpty) {
                                    //   CreatToast().showToast(
                                    //     errorMessage:
                                    //         "Email or Mobile is required",
                                    //     context: context,
                                    //   );
                                    // } else if (passwordController
                                    //     .text.isEmpty) {
                                    //   CreatToast().showToast(
                                    //     errorMessage: "Password is required",
                                    //     context: context,
                                    //   );
                                    // } else if (passwordController.text.length <
                                    //     8) {
                                    //   CreatToast().showToast(
                                    //     errorMessage:
                                    //         "Password must not less than 8",
                                    //     context: context,
                                    //   );
                                    // } else {
                                    //   cubit.login(
                                    //       value: emailController.text,
                                    //       password: passwordController.text);
                                    // }
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
