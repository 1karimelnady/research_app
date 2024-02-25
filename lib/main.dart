import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:research_app/providers/language_provider.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';
import 'package:research_app/screens/notfications/notfications_services.dart';
import 'package:research_app/screens/researcher_screen/new_form.dart';
import 'package:research_app/screens/researcher_screen/researcher_form.dart';
import 'package:research_app/screens/researcher_screen/researcher_home_screen.dart';
import 'package:research_app/screens/researcher_screen/researches_screen.dart';
import 'package:research_app/screens/splach_screen.dart';
import 'package:research_app/utilities/cache_helper.dart';
import 'package:research_app/utilities/dio_helper.dart';
import 'package:research_app/utilities/providers.dart';

import 'cubit/main_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(messagingOnBackgroundHandler);
  NotificationsServices.foregroundMessage();
  NotificationsServices.getper();
  NotificationsServices.getToken();
  DioHelper.init();

  NotificationsServices.getper();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

@pragma('vm:entry-point')
Future<void> messagingOnBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
  print(message.notification!.body.toString());
  print(message.data.toString());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainCubit(),
          ),
        ],
        child: MultiProvider(
            providers: providers,
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: SplashScreen())));
  }
}
