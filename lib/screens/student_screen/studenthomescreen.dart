import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';
import 'package:research_app/model/student_researches_model.dart';
import 'package:research_app/screens/student_screen/researches_details.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_toast.dart';
import '../../utilities/text_style.dart';
import '../notfications/notfications_services.dart';

class StudentHomeScreen extends StatefulWidget {
  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  void initState() {
    MainCubit.get(context).getStudentResearches();
    NotificationsServices().firebaseInit(context);
    NotificationsServices.foregroundMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is GetResearchesErrorState) {
          CreatToast()
              .showToast(errorMessage: state.errorMessage, context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: MainCubit.get(context).studentResearchesList.isEmpty
              ? CreatLoading()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          MainCubit.get(context).studentResearchesList.length,
                      itemBuilder: (context, index) {
                        StudentResearchesModel research =
                            MainCubit.get(context).studentResearchesList[index];
                        String? Time = research.createdAt;
                        DateTime dateTime = DateTime.parse(Time!);
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
                                      "${CacheHelper.getData(key: "name")}",
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
                                              Icons.question_answer_rounded,
                                              color: mainColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Research Question :',
                                              style:
                                                  BlackTitle.display5(context),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              child: Text(
                                                "${research.researchQuestion}",
                                                style: BlackTitle.display5(
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
                                              style:
                                                  BlackTitle.display5(context),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 0),
                                              child: Text(
                                                '${research.credits}',
                                                style: BlackTitle.display5(
                                                    context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
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
                                              style:
                                                  BlackTitle.display5(context),
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
                                  TextButton(
                                    onPressed: () {
                                      RoutesManager.navigatorPush(
                                        context,
                                        ResearchesDetails(research: research),
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
                        );
                      }),
                ),
        );
      },
    );
  }
}
