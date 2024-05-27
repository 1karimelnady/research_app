import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/screens/student_screen/studenthomescreen.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_button.dart';
import '../../common_widget/create_loading.dart';
import '../../common_widget/create_toast.dart';
import '../../cubit/main_cubit.dart';
import '../../model/student_researches_model.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({Key? key}) : super(key: key);

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getGrades();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state is GetGradesLoading
                ? CreatLoading()
                : ListView.builder(
                    itemCount: MainCubit.get(context).getGradesList.length,
                    itemBuilder: (context, index) {
                      MainCubit cubit = MainCubit.get(context);
                      String? Time =
                          cubit.getGradesList[index].research!.createdAt;
                      DateTime dateTime = DateTime.parse(Time!);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 12),
                        child: Card(
                          elevation: 2,
                          shadowColor: thirdColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: mainColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Researcher : ',
                                            style: BlackTitle.display5(context),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${cubit.getGradesList[index].researcher!.name}',
                                        style: BlackLabel.display5(context),
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
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.question_answer_rounded,
                                            color: mainColor,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Research Question :',
                                            style: BlackTitle.display5(context),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30.0), // Adjust as needed
                                        child: Text(
                                          "${cubit.getGradesList[index].research!.researchQuestion}",
                                          style: BlackLabel.display5(context),
                                          softWrap: true, // Allow text to wrap
                                        ),
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
                                          SizedBox(width: 5),
                                          Text(
                                            ' Credits : ',
                                            style: BlackTitle.display5(context),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0),
                                            child: Text(
                                              '${cubit.getGradesList[index].research?.credits ?? ''}',
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
                                            ' Date : ',
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
                                            Icons.select_all,
                                            color: mainColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'status : ',
                                            style: BlackTitle.display5(context),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${cubit.getGradesList[index].isSuccess == true ? 'success' : 'fail'}',
                                        style: BlackLabel.display5(context),
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
