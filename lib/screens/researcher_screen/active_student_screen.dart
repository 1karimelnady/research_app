import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:research_app/common_widget/create_button.dart';

import '../../app_manager/local_data.dart';
import '../../app_manager/routes_manager.dart';
import '../../utilities/text_style.dart';

class ActiveStudentScreen extends StatelessWidget {
  const ActiveStudentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child:

              //pendingStudentsStatus.isNotEmpty
              //  ?
              ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            physics: BouncingScrollPhysics(),
            itemCount: 10,

            //pendingStudentsStatus.length,
            itemBuilder: (context, index) {
              //  StudentsStatus studentStatus = pendingStudentsStatus[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // RoutesManager.navigatorPush(
                    //   context,
                    //   RequestsDetails(
                    //     researcher: researcher,
                    //     studentStatus: index,
                    //   ),
                    // );
                  },
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
                              "karim",
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
                                      'Gender:',
                                      style: BlackTitle.display5(context),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Male",
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
                                      "karim728",
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
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
          )
          //     : Center(
          //   child: Text(
          //     "No Pending Request",
          //     style:
          //     BlackTitle.display5(context).copyWith(color: Colors.red),
          //   ),
          // ),
          ),
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
