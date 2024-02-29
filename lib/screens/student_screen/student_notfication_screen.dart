import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '../../app_manager/local_data.dart';
import '../../common_widget/create_loading.dart';
import '../../cubit/application_states/main_states.dart';
import '../../cubit/main_cubit.dart';
import '../../utilities/text_style.dart';

class StudentNotificationScreen extends StatefulWidget {
  const StudentNotificationScreen({Key? key}) : super(key: key);

  @override
  State<StudentNotificationScreen> createState() =>
      _StudentNotificationScreen();
}

class _StudentNotificationScreen extends State<StudentNotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MainCubit>(context).getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<MainCubit, MainStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          MainCubit mainCubit = MainCubit.get(context);

          return Directionality(
            textDirection: TextDirection.ltr,
            child: state is NotificationLoading
                ? CreatLoading()
                : (state is NotificationSuccess &&
                        mainCubit.notificationList.isEmpty)
                    ? Center(child: Text("No Notification"))
                    : ListView.builder(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: mainCubit.notificationList.length,
                        itemBuilder: (context, index) {
                          String? Time =
                              mainCubit.notificationList[index].updatedAt;
                          DateTime dateTime = DateTime.parse(Time!);
                          return Card(
                              shadowColor: thirdColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Card(
                                                margin: EdgeInsets.all(0),
                                                elevation: 5,
                                                shape: CircleBorder(),
                                                child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/Frame 67.png")),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${mainCubit.notificationList[index].title}",
                                                    // mainCubit.notifications[index].senderName!,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: MainTitle.display5(
                                                            context)
                                                        .copyWith(fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${mainCubit.notificationList[index].createdAt!.substring(0, 10)}",
                                                style: MainLabel.display5(
                                                        context)
                                                    .copyWith(
                                                        color:
                                                            Color(0xff666666)),
                                              ),
                                              Text(
                                                "${intl.DateFormat.Hm().format(dateTime)}",
                                                style: MainLabel.display5(
                                                        context)
                                                    .copyWith(
                                                        color:
                                                            Color(0xff666666)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8),
                                    child: Text(
                                      "${mainCubit.notificationList[index].body}",
                                      style: MainLabel.display5(context)
                                          .copyWith(
                                              fontSize: 11,
                                              color:
                                                  mainColor.withOpacity(0.4)),
                                    ),
                                  ),
                                ],
                              ));
                        }),
          );
        },
      )),
    );
  }
}
