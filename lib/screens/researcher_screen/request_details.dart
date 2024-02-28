import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/model/researches_model.dart';
import 'package:research_app/screens/researcher_screen/researches_screen.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_button.dart';
import '../../common_widget/create_toast.dart';
import '../../cubit/main_cubit.dart';
import '../../utilities/text_style.dart';

class RequestsDetails extends StatelessWidget {
  final Researches researcher;
  final int studentStatus;
  const RequestsDetails({
    Key? key,
    required this.researcher,
    required this.studentStatus,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    StudentsStatus selectedStudentStatus =
        researcher.studentsStatus![studentStatus];
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {
          if (state is AcceptSuccessStatusState) {
            CreatToast().showToast(
                errorMessage: "Research Accepted successfully ",
                backgroundColor: mainColor,
                context: context);
            RoutesManager.navigatorPush(context, ResearchesScreen());
          } else if (state is RefusedSuccessStatusState) {
            CreatToast().showToast(
                errorMessage: "Research Rejected successfully ",
                backgroundColor: mainColor,
                context: context);
            RoutesManager.navigatorPush(context, ResearchesScreen());
          } else if (state is AcceptLoadingState) {
            CreatLoading();
          } else if (state is RefuseLoadingState) {
            CreatLoading();
          } else if (state is AcceptErrorStatusState) {
            CreatToast().showToast(
                errorMessage: state.errorMessage,
                backgroundColor: mainColor,
                context: context);
          } else if (state is RefusedErrorStatusState) {
            CreatToast().showToast(
                errorMessage: state.errorMessage,
                backgroundColor: mainColor,
                context: context);
          }
        },
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return SafeArea(
            child: Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  physics: BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    String? Time =
                        selectedStudentStatus.student?.createdAt ?? '';
                    DateTime dateTime = DateTime.parse(Time);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(dateTime);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0.4,
                        color: mainColor.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                                  "${selectedStudentStatus.student?.name ?? ''}",
                                  style: BlackLabel.display5(context),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'email :',
                                          style: BlackTitle.display5(context),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0.0),
                                          child: Text(
                                            "${selectedStudentStatus.student?.email ?? ''}",
                                            style: BlackLabel.display5(context),
                                          ),
                                        )
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
                                    Wrap(
                                      children: [
                                        Icon(
                                          Icons.transcribe,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Gender  : ',
                                          style: BlackTitle.display5(context),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            '${selectedStudentStatus.student?.gender ?? ''}',
                                            style: BlackLabel.display5(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Research Date : ',
                                          style: BlackTitle.display5(context),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '$formattedDate',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mobile_friendly,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Mobile : ',
                                          style: BlackTitle.display5(context),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${selectedStudentStatus.student?.mobile}'
                                      ' ',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.hand ?? ''}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.language ?? ''}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.version ?? ''}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.hearingNormal}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.origin}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.aDHD}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                      '${selectedStudentStatus.student?.musicalBackground ?? ''}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.description,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'description : ',
                                          style: BlackTitle.display5(context),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${researcher.description != null ? researcher.description : 'des'}',
                                      style: BlackLabel.display5(context),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  state is AcceptLoadingState
                                      ? CreatLoading()
                                      : Row(
                                          children: [
                                            CreateButton(
                                              title: 'Accept',
                                              width: getSize(context: context)
                                                      .width *
                                                  0.4,
                                              onTap: () async {
                                                await MainCubit.get(context)
                                                    .AcceptOrRefuse(
                                                        status: "accepted",
                                                        id: researcher.sId!,
                                                        student: researcher
                                                            .researher!.sId!);

                                                print(researcher.sId);
                                                print(
                                                    researcher.researher!.sId);
                                              },
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  state is RefuseLoadingState
                                      ? CreatLoading()
                                      : Row(
                                          children: [
                                            CreateButton(
                                              width: getSize(context: context)
                                                      .width *
                                                  0.4,
                                              title: 'Refuse',
                                              onTap: () async {
                                                await MainCubit.get(context)
                                                    .AcceptOrRefuse(
                                                        status: "rejected",
                                                        id: researcher.sId!,
                                                        student: researcher
                                                            .researher!.sId!);
                                              },
                                              backGround: Colors.red,
                                              colorBorder: Colors.red,
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )),
          );
        },
      ),
    );
  }
}
