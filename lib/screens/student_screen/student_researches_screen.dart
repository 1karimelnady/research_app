import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/utilities/text_style.dart';

import '../../cubit/main_cubit.dart';
import '../../model/researches_student_status_model.dart';

class StudentResearchesScreen extends StatefulWidget {
  const StudentResearchesScreen({super.key});

  @override
  State<StudentResearchesScreen> createState() =>
      _StudentResearchesScreenState();
}

class _StudentResearchesScreenState extends State<StudentResearchesScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    MainCubit.get(context).getStudentResearchesStatus(status: "pending");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                            MainCubit.get(context)
                                .getStudentResearchesStatus(status: "pending");
                            print(MainCubit.get(context)
                                .studentResearchesStatusPendingList
                                .length);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100.w,
                            height: 30.h,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? mainColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: selectedIndex == 0
                                      ? Colors.transparent
                                      : Colors.black),
                            ),
                            child: Text(
                              'Pending',
                              style: BlackLabel.display5(context).copyWith(
                                  color: selectedIndex == 0
                                      ? Colors.white
                                      : Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                            MainCubit.get(context)
                                .getStudentResearchesStatus(status: "accepted");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? mainColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: selectedIndex == 1
                                      ? Colors.transparent
                                      : Colors.black),
                            ),
                            child: Text(
                              'Accepted',
                              style: BlackLabel.display5(context).copyWith(
                                  color: selectedIndex == 1
                                      ? Colors.white
                                      : Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                            MainCubit.get(context)
                                .getStudentResearchesStatus(status: "rejected");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? mainColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: selectedIndex == 2
                                      ? Colors.transparent
                                      : Colors.black),
                            ),
                            child: Text(
                              'Rejected',
                              style: BlackLabel.display5(context).copyWith(
                                  color: selectedIndex == 2
                                      ? Colors.white
                                      : Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  selectedIndex == 0 ? buildPendingList() : SizedBox(),
                  selectedIndex == 1 ? buildAcceptedList() : SizedBox(),
                  selectedIndex == 2 ? buildRefusedList() : SizedBox(),
                ],
              ),
            ),
          );
        });
  }

  Widget buildAcceptedList() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MainCubit.get(context).state
              is GetStudentResearchesStatusLoadingState
          ? Center(
              child: CreatLoading()) // Show loading indicator while loading
          : MainCubit.get(context).studentResearchesStatusAcceptList.isEmpty
              ? Center(
                  child: Text(
                  "Empty Accepted Researches",
                  style: BlackLabel.display5(context)
                      .copyWith(color: Colors.red, fontSize: 14),
                ))
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    physics: BouncingScrollPhysics(),
                    itemCount: MainCubit.get(context)
                        .studentResearchesStatusAcceptList
                        .length,
                    itemBuilder: (context, index) {
                      ResearchesStatus research = MainCubit.get(context)
                          .studentResearchesStatusAcceptList[index];
                      String? Time = research.createdAt;
                      DateTime dateTime = DateTime.parse(Time!);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);

                      return Column(
                        children: research.studentsStatus?.map((studentStatus) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                        Center(
                                          child: Text(
                                            "${studentStatus.student?.name ?? ''}",
                                            style: BlackLabel.display5(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_rounded,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Research Question:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      "${research.researchQuestion}",
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
                                                  )
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.credit_score,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Credits : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      '${research.credits}',
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.credit_score,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Credits : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      '${research.credits}',
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
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
                                                    Icons.schedule,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Date : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '$formattedDate',
                                                style: BlackLabel.display5(
                                                    context),
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_rounded,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Description :',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      "${research.description}",
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Add more details here...
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })?.toList() ??
                            [],
                      );
                    },
                  ),
                ),
    ));
  }

  Widget buildPendingList() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MainCubit.get(context).state
              is GetStudentResearchesStatusLoadingState
          ? Center(
              child: CreatLoading()) // Show loading indicator while loading
          : MainCubit.get(context).studentResearchesStatusPendingList.isEmpty
              ? Center(
                  child: Text(
                    "Empty Pending Researches",
                    style: BlackLabel.display5(context).copyWith(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    physics: BouncingScrollPhysics(),
                    itemCount: MainCubit.get(context)
                        .studentResearchesStatusPendingList
                        .length,
                    itemBuilder: (context, index) {
                      ResearchesStatus research = MainCubit.get(context)
                          .studentResearchesStatusPendingList[index];
                      String? Time = research.createdAt;
                      DateTime dateTime = DateTime.parse(Time!);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);

                      return Column(
                        children: research.studentsStatus?.map((studentStatus) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                        Center(
                                          child: Text(
                                            "${studentStatus.student?.name ?? ''}",
                                            style: BlackLabel.display5(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_rounded,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Research Question:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      "${research.researchQuestion}",
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
                                                  )
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.credit_score,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Credits : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      '${research.credits}',
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.credit_score,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Credits : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      '${research.credits}',
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
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
                                                    Icons.schedule,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Date : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '$formattedDate',
                                                style: BlackLabel.display5(
                                                    context),
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_rounded,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Description :',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      "${research.description}",
                                                      style:
                                                          BlackTitle.display5(
                                                                  context)
                                                              .copyWith(
                                                                  fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Add more details here...
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })?.toList() ??
                            [],
                      );
                    },
                  ),
                ),
    ));
  }

  Widget buildRefusedList() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MainCubit.get(context).state
              is GetStudentResearchesStatusLoadingState
          ? Center(
              child: CreatLoading()) // Show loading indicator while loading
          : MainCubit.get(context).studentResearchesStatusRefusedList.isEmpty
              ? Center(
                  child: Text(
                    "Empty Rejected Researches",
                    style: BlackLabel.display5(context)
                        .copyWith(color: Colors.red, fontSize: 14),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    physics: BouncingScrollPhysics(),
                    itemCount: MainCubit.get(context)
                        .studentResearchesStatusRefusedList
                        .length,
                    itemBuilder: (context, index) {
                      ResearchesStatus research = MainCubit.get(context)
                          .studentResearchesStatusRefusedList[index];
                      String? Time = research.createdAt;
                      DateTime dateTime = DateTime.parse(Time!);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);

                      return Column(
                        children: research.studentsStatus?.map((studentStatus) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                        Center(
                                          child: Text(
                                            "${studentStatus.student?.name ?? ''}",
                                            style: BlackLabel.display5(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_rounded,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Research Question:',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      "${research.researchQuestion}",
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
                                                  )
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.credit_score,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Credits : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      '${research.credits}',
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.credit_score,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Credits : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      '${research.credits}',
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
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
                                                    Icons.schedule,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Date : ',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '$formattedDate',
                                                style: BlackLabel.display5(
                                                    context),
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
                                              Wrap(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_rounded,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Research Description :',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      "${research.description}",
                                                      style:
                                                          BlackTitle.display5(
                                                              context),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Add more details here...
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })?.toList() ??
                            [],
                      );
                    },
                  ),
                ),
    ));
  }
}
