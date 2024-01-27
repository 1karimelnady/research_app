import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/cubit/main_cubit.dart';
import 'package:research_app/providers/language_provider.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';
import 'package:research_app/screens/question_screen.dart';
import 'package:research_app/utilities/cache_helper.dart';
import 'package:research_app/utilities/dio_helper.dart';
import 'package:research_app/utilities/text_style.dart';
import 'package:toast/toast.dart';

import 'common_widget/create_toast.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final permission = Permission.notification;

  if (await permission.isDenied) {
    await permission.request();
  }

  // Future<PermissionStatus> permissionStatus =
  //     NotificationPermissions.requestNotificationPermissions();

  DioHelper.init();
  CacheHelper.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        // Add other providers if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MultiBlocProvider(
    // providers: [
    //  BlocProvider<MainCubit>(
    //       create: (context) => MainCubit()..requestNotificationPermission())
    // ],
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
