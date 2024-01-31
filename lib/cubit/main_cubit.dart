import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_states/main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  /////////////////////permission////////////////
  void requestNotificationPermission() async {
    print('karim');
    // FirebaseMessaging messaging = FirebaseMessaging.instance;
    // await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
  }

  ////////////////////////////notification//////////////////
  // List<NotificationModel> notifications = [];
  // Future<void> getReceivedNotifications() async {
  //   //// ب ترجع كل الاشعارات علشان تابت الاشعارات بعد معملت ليها بوست في  addNotification method
  //   notifications.clear();
  //   emit(ReceivedNotificationLoading());
  //   try {
  //     var response = await dio.get(
  //       baseUrl + "notifications/${SharedPreference.getData(key: "userId")}",
  //       options: Options(
  //         method: 'GET',
  //         headers: {
  //           HttpHeaders.authorizationHeader:
  //           'Bearer ${SharedPreference.getData(key: "token")}',
  //           'content-Type': 'application/json'
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       (response.data as List).forEach((element) {
  //         notifications.add(NotificationModel.fromJson(element));
  //       });
  //
  //       emit(ReceivedNotificationSuccess());
  //     }
  //   } on DioError catch (error) {
  //     print(error.toString());
  //     if (error.error is SocketException) {
  //       emit(ServerErrorMain());
  //     } else {
  //       emit(ReceivedNotificationError());
  //     }
  //   }
  // }
}
