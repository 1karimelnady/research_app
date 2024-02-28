import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/model/researches_model.dart';
import 'package:research_app/screens/researcher_screen/request_details.dart';

import '../../app_manager/local_data.dart';
import '../../app_manager/routes_manager.dart';
import '../../cubit/application_states/main_states.dart';
import '../../cubit/main_cubit.dart';
import '../../utilities/text_style.dart';

class ResearchesRequests extends StatelessWidget {
  final Researches researcher;
  const ResearchesRequests({Key? key, required this.researcher})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? Time = researcher.createdAt;
    DateTime dateTime = DateTime.parse(Time!);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return Scaffold(
              body: researcher.studentsStatus!.isEmpty
                  ? Center(
                      child: Text(
                        "No Requests Now  ",
                        style: BlackTitle.display5(context)
                            .copyWith(color: Colors.red, fontSize: 16),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          physics: BouncingScrollPhysics(),
                          itemCount: researcher.studentsStatus?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  RoutesManager.navigatorPush(
                                    context,
                                    RequestsDetails(research: researcher),
                                  );
                                },
                                child: Card(
                                  elevation: 0.4,
                                  color: mainColor.withOpacity(0.1),
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
                                            "${researcher.studentsStatus![index].student?.name ?? ''}",
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
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.transcribe,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Gender :',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "${researcher.studentsStatus![index].student?.gender ?? ''}",
                                                    style: BlackLabel.display5(
                                                        context),
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
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.email_outlined,
                                                    color: mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Email :',
                                                    style: BlackTitle.display5(
                                                        context),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "${researcher.studentsStatus![index].student?.email ?? ''}",
                                                    style: BlackLabel.display5(
                                                        context),
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
                                                  research: researcher),
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
                          }),
                    ));
        },
      ),
    );
  }
}
