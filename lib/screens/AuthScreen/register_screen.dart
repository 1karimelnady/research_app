import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/screens/AuthScreen/complete_register_screen.dart';
import 'package:toast/toast.dart';
import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_toast.dart';
import '../../utilities/text_style.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit registerCubit = AuthCubit.get(context);
          return Center(
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Choose your role and start  today!',
                          style: BlackTitle.display5(context)
                              .copyWith(fontSize: 20)),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AuthCubit>().isStudent = true;
                                  context.read<AuthCubit>().isProfessor = false;
                                  context.read<AuthCubit>().isResearcher =
                                      false;
                                  context.read<AuthCubit>().changType();
                                  print(context.read<AuthCubit>().userType);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5.0),
                                      color: registerCubit.isStudent
                                          ? Colors.blue[300]
                                          : Colors.grey[300]),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 11.0),
                                        child: Image.asset(
                                          'assets/images/Frame.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      const Text(
                                        'Student',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AuthCubit>().isStudent = false;
                                  context.read<AuthCubit>().isProfessor = false;
                                  context.read<AuthCubit>().isResearcher = true;
                                  context.read<AuthCubit>().changType();
                                  print(context.read<AuthCubit>().userType);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5.0),
                                      color: registerCubit.isResearcher
                                          ? Colors.blue[300]
                                          : Colors.grey[300]),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 31.0),
                                        child: SvgPicture.asset(
                                          'assets/images/noun-researcher-1923622.svg',
                                          height:
                                              getSize(context: context).height *
                                                  0.12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      const Text(
                                        'Researcher',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AuthCubit>().isStudent = false;
                                  context.read<AuthCubit>().isProfessor = true;
                                  context.read<AuthCubit>().isResearcher =
                                      false;
                                  context.read<AuthCubit>().changType();
                                  print(context.read<AuthCubit>().userType);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5.0),
                                      color: registerCubit.isProfessor
                                          ? Colors.blue[300]
                                          : Colors.grey[300]),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 11.0),
                                        child: SvgPicture.asset(
                                          'assets/images/Frame.svg',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      const Text(
                                        'Professor',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CreateButton(
                        onTap: () {
                          if (context.read<AuthCubit>().userType == null) {
                            CreatToast().showToast(
                                errorMessage: "Choose your role",
                                context: context,
                                gravity: Toast.lengthLong);
                          } else {
                            RoutesManager.navigatorPush(
                                context,
                                CompleteRegisterScreen(
                                    userType:
                                        context.read<AuthCubit>().userType!));
                          }
                        },
                        elevation: 0,
                        radius: 40,
                        bottomMargin: 0,
                        height: getSize(context: context).height * 0.06,
                        width: getSize(context: context).width * 0.9,
                        title: 'Continue',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Opensans'),
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
                                      context, const LoginScreen());
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainColor,
                                      fontFamily: 'Opensans'),
                                ))
                          ],
                        ),
                      ),
                    ],
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
