import 'package:flutter/material.dart';
import 'package:research_app/model/researches_model.dart';
import 'package:research_app/screens/researcher_screen/request_details.dart';

import '../../app_manager/local_data.dart';
import '../../app_manager/routes_manager.dart';
import '../../utilities/text_style.dart';

class ResearchesRequests extends StatelessWidget {
  final Researches researcher;
  final int status;
  final List<StudentsStatus> pendingStudentsStatus;

  const ResearchesRequests({
    Key? key,
    required this.researcher,
    required this.status,
    required this.pendingStudentsStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: pendingStudentsStatus.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                itemCount: pendingStudentsStatus.length,
                itemBuilder: (context, index) {
                  StudentsStatus studentStatus = pendingStudentsStatus[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        RoutesManager.navigatorPush(
                          context,
                          RequestsDetails(
                            researcher: researcher,
                            studentStatus: index,
                          ),
                        );
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
                                  "${studentStatus.student?.name ?? ''}",
                                  style: BlackLabel.display5(context),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                          "${studentStatus.student?.gender ?? ''}",
                                          style: BlackLabel.display5(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                          "${studentStatus.student?.email ?? ''}",
                                          style: BlackLabel.display5(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  RoutesManager.navigatorPush(
                                    context,
                                    RequestsDetails(
                                      researcher: researcher,
                                      studentStatus: index,
                                    ),
                                  );
                                },
                                child: Text(
                                  'More details',
                                  style: BlackLabel.display5(context)
                                      .copyWith(color: mainColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "No Pending Request",
                  style:
                      BlackTitle.display5(context).copyWith(color: Colors.red),
                ),
              ),
      ),
    );
  }
}
