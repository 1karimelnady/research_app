import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/common_widget/create_toast.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_button.dart';
import '../../common_widget/create_loading.dart';
import '../../cubit/application_states/main_states.dart';
import '../../cubit/main_cubit.dart';
import '../../utilities/text_style.dart';

class ActiveStudentScreen extends StatefulWidget {
  const ActiveStudentScreen({Key? key}) : super(key: key);

  @override
  State<ActiveStudentScreen> createState() => _ActiveStudentScreenState();
}

class _ActiveStudentScreenState extends State<ActiveStudentScreen> {
  bool isLoadingYes = false;
  bool isLoadingNo = false;
  bool isLoadingnotification = false;
  @override
  void initState() {
    super.initState();
    MainCubit cubit = BlocProvider.of<MainCubit>(context);
    cubit.getAcceptedStudentResearcher();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is SendNotificationSuccess) {
          CreatToast().showToast(
              errorMessage: "sending notification success",
              backgroundColor: mainColor,
              context: context);
        } else if (state is SendGradeSuccess) {
          CreatToast().showToast(
              errorMessage: " Grades Added Successfully",
              backgroundColor: mainColor,
              context: context);
        } else if (state is SendGradeError) {
          CreatToast().showToast(
              errorMessage: " Grades Added before", context: context);
        }
      },
      builder: (context, state) {
        MainCubit cubit = BlocProvider.of<MainCubit>(context);
        return SafeArea(
          child: Scaffold(
            body: state is GetStudentAcceptLoadingState
                ? CreatLoading()
                : cubit.acceptedStudentList.isEmpty
                    ? Center(
                        child: Text(
                          "No Active Student",
                          style: BlackTitle.display5(context)
                              .copyWith(color: Colors.red),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.acceptedStudentList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  elevation: 2,
                                  shadowColor: thirdColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: CircleAvatar(
                                            maxRadius: 30,
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                "assets/images/Frame.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Name:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "${cubit.acceptedStudentList[index].student?.name ?? ''}",
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.mobile_friendly,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Mobile:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "${MainCubit.get(context).acceptedStudentList[index].student?.mobile ?? ''}",
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.email_outlined,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Email:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "${cubit.acceptedStudentList[index].student?.email ?? ''}",
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.transcribe,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Gender:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "${cubit.acceptedStudentList[index].student?.gender ?? ''}",
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_outlined,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'hand : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.hand}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.language,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'language : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.language}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.view_sidebar_outlined,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'vision : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.version}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.hearing,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'hearingNormal : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.hearingNormal}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.trip_origin,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'origin : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.origin}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.sick,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'ADHD : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.aDHD}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.music_video,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'musicalBackground : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${cubit.acceptedStudentList[index].student?.musicalBackground}',
                                                style: BlackLabel.display5(
                                                    context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: CreateButton(
                                                title: 'Send Notification',
                                                onTap: () {
                                                  _showNotificationDialog(
                                                      context, index);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: CreateButton(
                                                title: 'Add Grades',
                                                onTap: () {
                                                  _showGradeDialog(
                                                      context, index);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
          ),
        );
      },
    );
  }

  void _showNotificationDialog(BuildContext context, index) {
    String title = '';
    String body = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Send Notification'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        title = value.trim();
                      });
                    },
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        body = value.trim();
                      });
                    },
                    decoration: InputDecoration(labelText: 'Body'),
                    maxLines: null,
                  ),
                ],
              ),
              actions: [
                isLoadingnotification
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: (title.trim().isEmpty || body.trim().isEmpty)
                            ? null
                            : () async {
                                MainCubit cubit =
                                    BlocProvider.of<MainCubit>(context);
                                setState(() {
                                  isLoadingnotification = true;
                                });
                                await cubit.sendNotification(
                                    title: title,
                                    body: body,
                                    id: cubit
                                        .acceptedStudentList[index].researchId!,
                                    user_id: cubit.acceptedStudentList[index]
                                        .student!.sId!);
                                setState(() {
                                  isLoadingnotification = false;
                                });
                                print(
                                    "${cubit.acceptedStudentList[index].researchId!}");
                                Navigator.pop(context);
                              },
                        child: isLoadingnotification
                            ? CircularProgressIndicator()
                            : Text('Send Notification'),
                      ),
              ],
            );
          },
        );
      },
    );
  }

  void _showGradeDialog(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Grades'),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "Have the student attend all meetings ?",
                  style: BlackLabel.display5(context).copyWith(fontSize: 11),
                )
              ]),
              actions: [
                isLoadingYes
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          MainCubit cubit = BlocProvider.of<MainCubit>(context);
                          setState(() {
                            isLoadingYes = true;
                          });
                          await cubit.sendGrade(
                              status: true,
                              research:
                                  cubit.acceptedStudentList[index].researchId!,
                              student: cubit
                                  .acceptedStudentList[index].student!.sId!);
                          setState(() {
                            isLoadingYes = false;
                          });
                          print(
                              "${cubit.acceptedStudentList[index].researchId!}");
                          Navigator.pop(context);
                        },
                        child: isLoadingYes
                            ? CircularProgressIndicator()
                            : Text('Yes'),
                      ),
                isLoadingNo
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          MainCubit cubit = BlocProvider.of<MainCubit>(context);
                          setState(() {
                            isLoadingNo = true;
                          });
                          await cubit.sendGrade(
                              status: false,
                              research:
                                  cubit.acceptedStudentList[index].researchId!,
                              student: cubit
                                  .acceptedStudentList[index].student!.sId!);
                          setState(() {
                            isLoadingNo = false;
                          });
                          print(
                              "${cubit.acceptedStudentList[index].researchId!}");
                          Navigator.pop(context);
                        },
                        child: isLoadingNo
                            ? CircularProgressIndicator()
                            : Text('No'),
                      ),
              ],
            );
          },
        );
      },
    );
  }
}
