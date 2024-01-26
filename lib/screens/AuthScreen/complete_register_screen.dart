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
import 'package:research_app/screens/AuthScreen/login_screen.dart';
import 'package:research_app/screens/home_screen.dart';
import 'package:research_app/screens/question_screen.dart';
import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_text_field.dart';
import '../../common_widget/create_toast.dart';
import '../../providers/language_provider.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';

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
        dateController.text =
            DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(picked);
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
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
          print('AuthCubit State: $state');
          if (state is RegisterSuccess) {
            CacheHelper.setData(key: "type", value: state.response['type']);
            CacheHelper.setData(key: "token", value: state.response['token']);
            String userType = CacheHelper.getData(key: "type") ?? "";

            if (userType == "student") {
              RoutesManager.navigatorPush(context, QuestionScreen());
            } else if (userType == "professor") {
              RoutesManager.navigatorPush(context, const HomeScreen());
            } else if (userType == "researcher") {
              RoutesManager.navigatorPush(context, const HomeScreen());
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
                child: Form(
                  key: formKey,
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
                          height: 5,
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
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: "Email or Mobile",
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
                              Icons.person,
                              size: 30,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CreatTextField(
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
                          height: 5,
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
                              controller: passwordController,
                              obSecureText: registerCubit.isPassword,
                              label: "password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  registerCubit.changeVisibilty();
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Icon(
                                    registerCubit.visibleicon,
                                    size: 30,
                                    color: greyColor,
                                  ),
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
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              label: "Mobile",
                              labelStyle: const TextStyle(
                                  color: greyColor, fontFamily: 'Cairo'),
                            ),
                          ],
                        ),

                        // CreatLargDropDown(authCubit: AuthCubit.get(context)),

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
                              width: 35,
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
                            Text(
                              "male",
                              style: BlackTitle.display5(context)
                                  .copyWith(color: const Color(0xff666666)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 35,
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
                            Text(
                              "female",
                              style: BlackTitle.display5(context).copyWith(
                                color: const Color(0xff666666),
                              ),
                            )
                          ],
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
                        ConditionalBuilder(
                          condition: state is! RegisterLoading,
                          builder: (context) => CreateButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (emailController.text.isEmpty) {
                                    CreatToast().showToast(
                                      errorMessage:
                                          "Email or Mobile is required",
                                      context: context,
                                    );
                                  } else if (nameController.text.isEmpty) {
                                    CreatToast().showToast(
                                      errorMessage: "Name is required",
                                      context: context,
                                    );
                                  } else if (passwordController.text.isEmpty) {
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
                                  } else if (phoneController.text.isEmpty) {
                                    CreatToast().showToast(
                                      errorMessage: "Mobile is required",
                                      context: context,
                                    );
                                  } else {
                                    print(
                                        "User Type before registration: ${registerCubit.userType}");
                                    registerCubit.register(
                                      name: nameController.text,
                                      email: emailController.text,
                                      mobile: phoneController.text,
                                      password: passwordController.text,
                                      userGender: userGender,
                                      birthDate: dateController.text,
                                      userType: widget.userType,
                                    );
                                    print(
                                        "User Type after registration${registerCubit.userType}");
                                  }
                                }
                              },
                              elevation: 0,
                              radius: 40,
                              bottomMargin: 0,
                              height: getSize(context: context).height * 0.05,
                              width: getSize(context: context).width * 0.9,
                              title: "Register"),
                          fallback: (BuildContext context) =>
                              const CreatLoading(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo'),
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
        }));
  }
}
// GestureDetector(
//   onTap: () {
//     setState(() {
//       isStrechedDropDown = !isStrechedDropDown;
//     });
//   },
//   child: Container(
//     width: double.infinity,
//     padding: const EdgeInsets.symmetric(horizontal: 5),
//     child: SafeArea(
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                   child: Container(
//                 decoration: BoxDecoration(
//                     border:
//                         Border.all(color: greyColor),
//                     borderRadius:
//                         const BorderRadius.all(
//                             Radius.circular(8))),
//                 child: Column(
//                   children: [
//                     Container(
//                         // height: 45,
//                         width: double.infinity,
//                         padding: const EdgeInsets.only(
//                           right: 10,
//                           bottom: 0,
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: const Color(
//                                   0xffbbbbbb),
//                             ),
//                             borderRadius:
//                                 const BorderRadius.all(
//                                     Radius.circular(
//                                         8))),
//                         constraints:
//                             const BoxConstraints(
//                           minHeight: 35,
//                           minWidth: double.infinity,
//                         ),
//                         alignment: Alignment.center,
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets
//                                         .symmetric(
//                                   horizontal: 5,
//                                 ),
//                                 child: Text(
//                                   title,
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isStrechedDropDown =
//                                         !isStrechedDropDown;
//                                   });
//                                 },
//                                 child: Icon(
//                                     isStrechedDropDown
//                                         ? Icons
//                                             .arrow_upward
//                                         : Icons
//                                             .arrow_downward))
//                           ],
//                         )),
//                     ExpandedSection(
//                       expand: isStrechedDropDown,
//                       height: 5,
//                       child: MyScrollbar(
//                         builder: (context,
//                                 scrollController2) =>
//                             ListView.builder(
//                                 padding:
//                                     const EdgeInsets
//                                         .all(0),
//                                 controller:
//                                     scrollController2,
//                                 shrinkWrap: true,
//                                 itemCount: _list.length,
//                                 itemBuilder:
//                                     (context, index) {
//                                   return RadioListTile(
//                                       contentPadding:
//                                           EdgeInsets
//                                               .zero,
//                                       title: Padding(
//                                         padding:
//                                             const EdgeInsets
//                                                 .only(
//                                                 right:
//                                                     20.0),
//                                         child: Text(_list
//                                             .elementAt(
//                                                 index)),
//                                       ),
//                                       value: index,
//                                       groupValue:
//                                           groupValue,
//                                       onChanged: (val) {
//                                         setState(() {
//                                           groupValue =
//                                               val;
//                                           title = _list
//                                               .elementAt(
//                                                   index);
//                                         });
//                                         print(title);
//                                       });
//                                 }),
//                         scrollController:
//                             _scrollController,
//                       ),
//                     )
//                   ],
//                 ),
//               )),
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
// ),
