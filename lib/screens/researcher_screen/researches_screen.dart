import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';

import '../../app_manager/local_data.dart';
import '../../model/researches_model.dart';
import '../../utilities/text_style.dart';

class ResearchesScreen extends StatefulWidget {
  @override
  _ResearchesScreenState createState() => _ResearchesScreenState();
}

class _ResearchesScreenState extends State<ResearchesScreen> {
  @override
  void initState() {
    super.initState();
    MainCubit.get(context).fetchResearches();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: MainCubit.get(context).researchesList.isEmpty
              ? CreatLoading()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      physics: BouncingScrollPhysics(),
                      itemCount: MainCubit.get(context).researchesList.length,
                      itemBuilder: (context, index) {
                        Researches research =
                            MainCubit.get(context).researchesList[index];
                        String? Time = research.createdAt;
                        DateTime dateTime = DateTime.parse(Time!);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(dateTime);

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 0.4,
                            color: mainColor.withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.new_releases,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'New Requests',
                                          style: BlackTitle.display5(context),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: mainColor,
                                              width: 2,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            '${research.studentsStatus?.length ?? 0}',
                                            style: BlackLabel.display5(context),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
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
