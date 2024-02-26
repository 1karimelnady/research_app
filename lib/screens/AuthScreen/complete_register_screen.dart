import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/screens/researcher_screen/researcher_home_screen.dart';
import 'package:research_app/screens/student_screen/question_screen.dart';
import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';
import '../professor_screen/professor_home_screen.dart';

class CompleteRegisterScreen extends StatefulWidget {
  final String userType;
  const CompleteRegisterScreen({super.key, required this.userType});

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LanguageProvider? languageProvider;
  bool isStudent = true;
  List<String> registerUserGender = ["male", "female"];
  String userGender = "male";
  bool isStrechedDropDown = false;
  String title = 'Select Type';

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
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void initState() {
    // CacheHelper.registerClear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    String name;
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
          print('AuthCubit State: $state');
          if (state is RegisterSuccess) {
            CreatToast().showToast(
                errorMessage: "Register Successfully",
                context: context,
                backgroundColor: mainColor);
            name = state.response['name'];
            CacheHelper.setData(key: "type", value: state.response['type']);
            CacheHelper.setData(key: "token", value: state.response['token']);
            String userType = CacheHelper.getData(key: "type") ?? "";
            if (userType == "professor") {
              RoutesManager.navigatorAndRemove(
                  context, ProfessorHomeSCreen(name: name));
            } else if (userType == "researcher") {
              RoutesManager.navigatorAndRemove(context, ResearcherHomeScreen());
            } else if (userType == "student") {
              RoutesManager.navigatorAndRemove(
                  context,
                  QuestionScreen(
                    userName: nameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    mobile: phoneController.text,
                    userGender: userGender,
                    date: dateController.text,
                    userType: widget.userType,
                  ));
            }
          } else if (state is RegisterError) {
            CreatToast().showToast(
              errorMessage: state.errormessage,
              context: context,
            );
          }
        }, builder: (context, state) {
          AuthCubit registerCubit = AuthCubit.get(context);
          return Scaffold(
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
                          height: getSize(context: context).height * 0.22,
                          image: const AssetImage('assets/images/36.png'),
                        ),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 30,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CreatTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              label: "Name",
                              labelStyle: const TextStyle(
                                fontFamily: 'Cairo',
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
                              Icons.alternate_email_rounded,
                              size: 30,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CreatTextField(
                              // width: double.infinity,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is required";
                                }
                                return null;
                              },
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: "Email",
                              labelStyle: const TextStyle(
                                  color: greyColor, fontFamily: 'Cairo'),
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
                              // width: double.infinity,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is required";
                                }
                                return null;
                              },
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 30,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CreatTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Mobile is required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              label: "Mobile",
                              labelStyle: const TextStyle(
                                  color: greyColor, fontFamily: 'Cairo'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Gender',
                          style: BlackTitle.display5(context).copyWith(
                            color: greyColor,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    vertical: -4,
                                    horizontal:
                                        -3), // Adjust the size of the radio button
                                value: registerUserGender[0],
                                groupValue: userGender,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (value) {
                                  setState(() {
                                    userGender = value!;
                                  });
                                  print("userType : $userGender");
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userGender = registerUserGender[0];
                                });
                                print("userType : $userGender");
                              },
                              child: Text(
                                "male",
                                style: BlackTitle.display5(context)
                                    .copyWith(color: const Color(0xff666666)),
                              ),
                            ),
                            SizedBox(
                              width: 42,
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  vertical: -4,
                                  horizontal: -3,
                                ),
                                value: registerUserGender[1],
                                groupValue: userGender,
                                onChanged: (value) {
                                  setState(() {
                                    userGender = value!;
                                  });
                                  print("userType : $userGender");
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userGender = registerUserGender[1];
                                });
                                print("userType : $userGender");
                              },
                              child: Text(
                                "female",
                                style: BlackTitle.display5(context).copyWith(
                                  color: const Color(0xff666666),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            // Icon(Icons.calendar_today_outlined),
                            IconButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: mainColor,
                              ),
                            ),
                            CreatTextField(
                              width: getSize(context: context).width * 0.67,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Birth date is required";
                                }
                                return null;
                              },
                              controller: dateController,
                              onSubmit: (value) {
                                setState(() {});
                              },
                              label: 'Select Date',
                              labelStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.grey.withOpacity(0.5)),
                              keyboardType: TextInputType.datetime,
                              onTap: () {
                                _selectDate(context);
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        (widget.userType == "researcher" ||
                                widget.userType == "professor")
                            ? ConditionalBuilder(
                                condition: state is! RegisterLoading,
                                builder: (context) => CreateButton(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        registerCubit.register(
                                          name: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          mobile: phoneController.text,
                                          password: passwordController.text,
                                          userGender: userGender,
                                          birthDate: dateController.text,
                                          userType: widget.userType,
                                        );
                                      }
                                    },
                                    elevation: 0,
                                    radius: 40,
                                    bottomMargin: 0,
                                    height:
                                        getSize(context: context).height * 0.05,
                                    width:
                                        getSize(context: context).width * 0.9,
                                    title: "Register"),
                                fallback: (BuildContext context) =>
                                    const CreatLoading(),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(color: mainColor)),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          if (phoneController.text.length < 9) {
                                            CreatToast().showToast(
                                              errorMessage:
                                                  "mobile must not less than 8",
                                              context: context,
                                            );
                                          } else {
                                            RoutesManager.navigatorPush(
                                                context,
                                                QuestionScreen(
                                                  userName: nameController.text
                                                      .trim(),
                                                  email: emailController.text
                                                      .trim(),
                                                  password: passwordController
                                                      .text
                                                      .trim(),
                                                  mobile: phoneController.text,
                                                  userGender: userGender,
                                                  date: dateController.text,
                                                  userType: widget.userType,
                                                ));
                                          }
                                        }
                                      },
                                      child: const Text(
                                        'Next',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(color: mainColor)),
                                    child: IconButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          if (phoneController.text.length < 9) {
                                            CreatToast().showToast(
                                              errorMessage:
                                                  "mobile must not less than 8",
                                              context: context,
                                            );
                                          } else {
                                            RoutesManager.navigatorPush(
                                                context,
                                                QuestionScreen(
                                                  userName: nameController.text
                                                      .trim(),
                                                  email: emailController.text
                                                      .trim(),
                                                  password: passwordController
                                                      .text
                                                      .trim(),
                                                  mobile: phoneController.text,
                                                  userType: widget.userType,
                                                  userGender: userGender,
                                                  date: dateController.text,
                                                ));
                                          }
                                        }
                                      },
                                      icon: const Padding(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
