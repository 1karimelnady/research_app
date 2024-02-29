import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/common_widget/create_button.dart';

import '../../app_manager/local_data.dart';
import '../../app_manager/routes_manager.dart';
import '../../cubit/main_cubit.dart';
import '../../utilities/text_style.dart';

class ActiveStudentScreen extends StatefulWidget {
  const ActiveStudentScreen({Key? key}) : super(key: key);

  @override
  State<ActiveStudentScreen> createState() => _ActiveStudentScreenState();
}

class _ActiveStudentScreenState extends State<ActiveStudentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<MainCubit>(context).getAcceptedStudentResearcher();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            physics: BouncingScrollPhysics(),
            itemCount: MainCubit.get(context).acceptedStudentList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0.4,
                    color: mainColor.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/Frame.png"),
                            ),
                          ),
                          Center(
                            child: Text(
                              "${MainCubit.get(context).acceptedStudentList[index].student?.name ?? ''}",
                              style: BlackLabel.display5(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.transcribe,
                                      color: mainColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Mobile:',
                                      style: BlackTitle.display5(context),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${MainCubit.get(context).acceptedStudentList[index].student?.mobile ?? ''}",
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      style: BlackTitle.display5(context),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${MainCubit.get(context).acceptedStudentList[index].student?.email ?? ''}",
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      style: BlackTitle.display5(context),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${MainCubit.get(context).acceptedStudentList[index].student?.gender ?? ''}",
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.question_answer_outlined,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'hand : ',
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.hand}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.language}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.version}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.hearingNormal}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.origin}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.aDHD}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      style: BlackTitle.display5(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${MainCubit.get(context).acceptedStudentList[index].student?.musicalBackground}',
                                  style: BlackLabel.display5(context),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CreateButton(
                                  title: 'Send Notification',
                                  onTap: () {
                                    _showNotificationDialog(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CreateButton(
                                  title: 'Add Credits',
                                  onTap: () {},
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
    );
  }

  void _showNotificationDialog(BuildContext context) {
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
                ElevatedButton(
                  onPressed: (title.trim().isEmpty || body.trim().isEmpty)
                      ? null
                      : () {
                          print(
                              'Sending notification: Title: $title, Body: $body');
                          Navigator.pop(context);
                        },
                  child: Text('Send Notification'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
