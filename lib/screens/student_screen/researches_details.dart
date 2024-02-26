import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/screens/student_screen/studenthomescreen.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_toast.dart';
import '../../cubit/main_cubit.dart';
import '../../model/student_researches_model.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';

class ResearchesDetails extends StatelessWidget {
  final StudentResearchesModel research;

  const ResearchesDetails({Key? key, required this.research}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {
          if (state is StudentRegisterResearchSuccessState) {
            CreatToast().showToast(
                errorMessage: "Registration successfully you are pending",
                backgroundColor: mainColor,
                context: context);
            RoutesManager.navigatorAndRemove(context, StudentHomeScreen());
          } else if (state is StudentRegisterResearchErrorState) {
            CreatToast()
                .showToast(errorMessage: state.errorMessage, context: context);
          }
        },
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
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
                                            style: BlackTitle.display5(context),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Text(
                                              "${research.researchQuestion}",
                                              style:
                                                  BlackLabel.display5(context),
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
                                            style: BlackTitle.display5(context),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0),
                                            child: Text(
                                              '${research.credits}',
                                              style:
                                                  BlackLabel.display5(context),
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
                                        '${research.hand!.join(", ")}',
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
                                        '${research.language!.join(", ")}',
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
                                        '${research.vision!.join(", ")}',
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
                                        '${research.hearingNormal!.join(", ")}',
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
                                        '${research.origin!.join(", ")}',
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
                                        '${research.aDHD!.join(", ")}',
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
                                        '${research.musicalBackground!.join(", ")}',
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
                                        '${research.description ?? 'des'}',
                                        // '${research.description}',
                                        style: BlackLabel.display5(context),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    state is StudentRegisterResearchLoadingState
                                        ? CreatLoading()
                                        : CreateButton(
                                            width: getSize(context: context)
                                                    .width *
                                                0.4,
                                            title: 'Registration',
                                            onTap: () async {
                                              cubit.registerResearch();
                                            },
                                          ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CreateButton(
                                      title: 'Cancel',
                                      width:
                                          getSize(context: context).width * 0.4,
                                      onTap: () {
                                        RoutesManager.navigatorPush(
                                            context, StudentHomeScreen());
                                      },
                                      backGround: Colors.red,
                                      colorBorder: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )),
          );
        },
      ),
    );
  }
}
