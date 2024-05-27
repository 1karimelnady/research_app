import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as init;
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/common_widget/create_toast.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/screens/researcher_screen/researcher_home_screen.dart';
import 'package:research_app/screens/student_screen/studenthomescreen.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../../../utilities/text_style.dart';
import '../../app_manager/local_data.dart';

import '../../common_widget/create_text_field.dart';
import '../../cubit/main_cubit.dart';
import '../../model/user_data.dart';

class EditResearcherProfile extends StatefulWidget {
  const EditResearcherProfile({super.key});

  @override
  State<EditResearcherProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditResearcherProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  File? image;

  bool isLoading = false;

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      print("object : ${File(pickedFile.path).path}");
    }
  }

  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is UpdateUserSuccess) {
          CreatToast().showToast(
              errorMessage: "User updated Successfully",
              context: context,
              backgroundColor: mainColor);

          RoutesManager.navigatorAndRemove(context, ResearcherHomeScreen());
        }
        if (state is UpdateUserError) {
          CreatToast()
              .showToast(errorMessage: state.errorMessage, context: context);
        }
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);

        if (cubit.userList.isNotEmpty) {
          UserDataModel userData = cubit.userList.first;
          nameController.text = userData.name ?? 'name';
          emailController.text = userData.email ?? 'email';
          mobileController.text = userData.mobile ?? 'mobile';
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.ltr,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: getSize(context: context).height * 0.03),
                      SizedBox(height: getSize(context: context).height * 0.05),
                      Container(
                        width: getSize(context: context).width * 0.3,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            image != null
                                ? Container(
                                    padding: EdgeInsets.all(0.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 3, color: mainColor),
                                    ),
                                    height:
                                        getSize(context: context).height * 0.14,
                                    width:
                                        getSize(context: context).height * 0.13,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(27),
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : cubit.userList.isNotEmpty &&
                                        cubit.userList.first.image !=
                                            null // Check if user's image URL is available
                                    ? Container(
                                        padding: EdgeInsets.all(0.5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              width: 3, color: mainColor),
                                        ),
                                        height:
                                            getSize(context: context).height *
                                                0.13,
                                        width:
                                            getSize(context: context).height *
                                                0.12,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(27),
                                          child: Image.network(
                                            cubit.userList.first
                                                .image!, // Use the user's image URL from the API response
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(0.5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              width: 3, color: mainColor),
                                        ),
                                        height:
                                            getSize(context: context).height *
                                                0.13,
                                        width:
                                            getSize(context: context).height *
                                                0.12,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(27),
                                          child: Image.asset(
                                            "assets/images/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _pickImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2, color: Colors.white)
                                              // borderRadius:
                                              //     BorderRadius.circular(10)
                                              ),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
                            onChange: (newValue) {
                              cubit.userList.first.name = newValue;
                            },
                            labelStyle: const TextStyle(
                              fontFamily: 'Opensans',
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
                                color: greyColor, fontFamily: 'Opensans'),
                            onChange: (newValue) {
                              cubit.userList.first.email = newValue;
                            },
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
                            controller: mobileController,
                            label: "Mobile",
                            onChange: (newValue) {
                              cubit.userList.first.mobile = newValue;
                            },
                            labelStyle: const TextStyle(
                                color: greyColor, fontFamily: 'Opensans'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: getSize(context: context).height * 0.13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          state is UpdateUserLoading
                              ? CreatLoading()
                              : OutlinedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.updateUser(
                                        name: nameController.text,
                                        email: emailController.text,
                                        mobile: mobileController.text,
                                        image: image,
                                      );
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: Text('Edit')),
                          OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Text('cancel')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
