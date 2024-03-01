import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:research_app/providers/language_provider.dart';
import 'package:research_app/screens/notfications/notfications_services.dart';
import 'package:research_app/screens/splach_screen.dart';
import 'package:research_app/utilities/cache_helper.dart';
import 'package:research_app/utilities/dio_helper.dart';
import 'package:research_app/utilities/providers.dart';

import 'cubit/main_cubit.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> messagingOnBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("message");
  print(message.notification!.title.toString());
  print(message.notification!.body.toString());
  print(message.data.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(messagingOnBackgroundHandler);
  await NotificationsServices.foregroundMessage();
  await NotificationsServices.getper();
  await NotificationsServices.getToken();
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
            child: ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    home: SplashScreen()))));
  }
}
