import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/screens/AuthScreen/complete_register_screen.dart';
import '../../app_manager/routes_manager.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    CacheHelper.registerClear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit registerCubit = AuthCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Choose your role and start  today!',
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 20)),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                          ? Colors.blue
                                          : Colors.grey[300]),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 5),
                                    child: Column(
                                      children: [

                                        Image.asset(
                                          'assets/images/Frame.png', // Replace with the actual path to your frame image
                                          width:
                                              90, // Adjust the width as needed
                                          height:
                                              100, // Adjust the height as needed
                                          fit: BoxFit
                                              .contain, // Adjust the BoxFit property as needed
                                        ),
                                        // SvgPicture.asset(
                                        //   'assets/images/Frame 67.png',
                                        //   width: 100,
                                        //   height: 100,
                                        // ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'I’m a student',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
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
                                          ? Colors.blue
                                          : Colors.grey[300]),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 5),
                                    child: Column(
                                      children: [

                                        SvgPicture.asset(
                                          'assets/images/Frame.svg',
                                          width: 90,
                                          height: 100,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'I’m a professor',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AuthCubit>().isStudent = false;
                                  context.read<AuthCubit>().isProfessor = false;
                                  context.read<AuthCubit>().isResearcher = true;
                                  context.read<AuthCubit>().changType();
                                  print(context.read<AuthCubit>().userType);
                                }
                                ,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5.0),
                                      color: registerCubit.isResearcher
                                          ? Colors.blue
                                          : Colors.grey[300]),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'images/noun-researcher-1923622.svg',
                                          width: 90,
                                          height: 100,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'I’m a researcher',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getSize(context: context).height * 0.3,
                    ),
                    CreateButton(
                      onTap: () {
                        RoutesManager.navigatorPush(
                            context,
                            CompleteRegisterScreen(
                                userType: context.read<AuthCubit>().userType!));
                      },
                      elevation: 0,
                      radius: 40,
                      bottomMargin: 0,
                      height: getSize(context: context).height * 0.07,
                      width: getSize(context: context).width * 0.9,
                      title: 'Continue',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
