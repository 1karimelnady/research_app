import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';
import 'package:research_app/screens/professor_screen/edit_professor_profile.dart';
import 'package:research_app/screens/professor_screen/researcher_details.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_loading.dart';
import '../../model/all_researcher_model.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';
import '../AuthScreen/login_screen.dart';

class ProfessorHomeSCreen extends StatefulWidget {
  @override
  State<ProfessorHomeSCreen> createState() => _ProfessorHomeSCreenState();
}

class _ProfessorHomeSCreenState extends State<ProfessorHomeSCreen> {
  @override
  void initState() {
    MainCubit cubit = BlocProvider.of<MainCubit>(context);
    cubit.getAllreseracher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          RoutesManager.navigatorPush(
                              context, EditProfessorProfile());
                        },
                        child: Text(
                          'Edit profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            CacheHelper.clear();
                            RoutesManager.navigatorAndRemove(
                                context, LoginScreen());
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          )),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            CacheHelper.clear();
                            RoutesManager.navigatorAndRemove(
                                context, LoginScreen());
                          },
                          icon: Icon(Icons.logout)),
                    ],
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MainCubit.get(context).state is GetAllResearcherLoading
                    ? Center(
                        child:
                            CreatLoading()) // Show loading indicator while loading
                    : MainCubit.get(context).getAllResearcherList.isEmpty
                        ? Center(
                            child: Text(
                              "No Researcher Found",
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
                                    .getAllResearcherList
                                    .length,
                                itemBuilder: (context, index) {
                                  Researchers research = MainCubit.get(context)
                                      .getAllResearcherList[index];
                                  String? Time = research.createdAt;
                                  DateTime dateTime = DateTime.parse(Time!);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(dateTime);

                                  return Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          RoutesManager.navigatorPush(
                                              context,
                                              ResearcherDetailScreen(
                                                  id: research.sId!));
                                        },
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
                                                    maxRadius: 25,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/Frame 67.png"),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Wrap(
                                                        children: [
                                                          Icon(
                                                            Icons.person,
                                                            color: mainColor,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            'name :',
                                                            style: BlackTitle
                                                                .display5(
                                                                    context),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 0.0),
                                                            child: Text(
                                                              "${research.name}",
                                                              style: BlackTitle
                                                                  .display5(
                                                                      context),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Wrap(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .mobile_friendly,
                                                            color: mainColor,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            'Mobile :',
                                                            style: BlackTitle
                                                                .display5(
                                                                    context),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 0.0),
                                                            child: Text(
                                                              "${research.mobile}",
                                                              style: BlackTitle
                                                                  .display5(
                                                                      context),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Wrap(
                                                        children: [
                                                          Icon(
                                                            Icons.email,
                                                            color: mainColor,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            'Email  : ',
                                                            style: BlackTitle
                                                                .display5(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 0),
                                                            child: Text(
                                                              '${research.email}',
                                                              style: BlackTitle
                                                                  .display5(
                                                                      context),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            style: BlackTitle
                                                                .display5(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 0),
                                                            child: Text(
                                                              '${research.gender}',
                                                              style: BlackTitle
                                                                  .display5(
                                                                      context),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
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
                                                            'Join Date : ',
                                                            style: BlackTitle
                                                                .display5(
                                                                    context),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '$formattedDate',
                                                        style:
                                                            BlackLabel.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]);
                                })),
              ));
        });
  }
}
// research.studentsStatus?.map((studentStatus)
