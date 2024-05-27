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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        fontFamily: 'Opensans'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                        return "user name required";
                      }
                      return null;
                    },
                    controller: userNameController,
                    label: "username",
                    labelStyle: const TextStyle(
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    label: "password",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility,
                        size: 30,
                        color: greyColor,
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
