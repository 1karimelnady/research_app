import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_button.dart';
import '../../common_widget/create_loading.dart';
import '../../cubit/application_states/main_states.dart';
import '../../cubit/main_cubit.dart';
import '../../model/researches_of_researcher_model.dart';
import '../../utilities/text_style.dart';

class ResearcherDetailScreen extends StatefulWidget {
  final String id;
  const ResearcherDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ResearcherDetailScreen> createState() => _ResearcherDetailScreenState();
}

class _ResearcherDetailScreenState extends State<ResearcherDetailScreen> {
  bool isLoading = false;
  @override
  void initState() {
    MainCubit cubit = BlocProvider.of<MainCubit>(context);
    cubit.getResearchesOfResearchers(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is GetAllResearchesError) {
          print('Error fetching researches');
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<MainCubit>(context);

        print('Current state: $state');
        return SafeArea(
            child: Scaffold(
                body: state is GetAllResearchesLoading
                    ? CreatLoading()
                    : (state is GetAllResearchesSuccess &&
                            cubit.researchesOfResearchersList.isEmpty)
                        ? Center(
                            child: Text(
                              "No Researches Found",
                              style: BlackTitle.display5(context)
                                  .copyWith(color: Colors.red),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    cubit.researchesOfResearchersList.length,
                                itemBuilder: (context, index) {
                                  print(
                                      'Item at index $index: ${cubit.researchesOfResearchersList[index]}');

                                  String? Time = MainCubit.get(context)
                                      .researchesOfResearchersList[index]
                                      .createdAt;
                                  DateTime dateTime = DateTime.parse(Time!);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(dateTime);
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        'Research Question :',
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 0.0),
                                                        child: Text(
                                                          "${cubit.researchesOfResearchersList[index].researchQuestion}",
                                                          style: BlackLabel
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 0),
                                                        child: Text(
                                                          '${cubit.researchesOfResearchersList[index].credits}',
                                                          style: BlackLabel
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].hand!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].language!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .view_sidebar_outlined,
                                                        color: mainColor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'vision : ',
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].vision!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].hearingNormal!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].origin!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].aDHD!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        style:
                                                            BlackTitle.display5(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].musicalBackground!.join(", ")}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Wrap(
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
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  Text(
                                                    '${cubit.researchesOfResearchersList[index].description ?? 'des'}',
                                                    style: BlackLabel.display5(
                                                        context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Center(
                                              child: CreateButton(
                                                title: 'Send Feedback',
                                                onTap: () {
                                                  _showFeedBackDialog(
                                                      context, index);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }))));
      },
    );
  }

  void _showFeedBackDialog(BuildContext context, index) {
    String title = '';
    String body = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Send Feedback'),
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
                      : () async {
                          MainCubit cubit = BlocProvider.of<MainCubit>(context);
                          setState(() {
                            isLoading = true;
                          });
                          await cubit.sendNotification(
                              title: title,
                              body: body,
                              id: cubit.researchesOfResearchersList[index].sId!,
                              user_id: widget.id);
                          setState(() {
                            isLoading = false;
                          });

                          Navigator.pop(context);
                        },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Send FeedBack'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
