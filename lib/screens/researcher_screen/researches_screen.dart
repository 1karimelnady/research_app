// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:research_app/app_manager/local_data.dart';
// import 'package:research_app/common_widget/create_loading.dart';
// import 'package:research_app/common_widget/create_toast.dart';
// import 'package:research_app/cubit/application_states/main_states.dart';
// import 'package:research_app/cubit/main_cubit.dart';
// import 'package:research_app/utilities/text_style.dart';
//
// import '../../model/researches_model.dart';
//
// class ResearchesScreen extends StatefulWidget {
//   const ResearchesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ResearchesScreen> createState() => _ResearchesScreenState();
// }
//
// class _ResearchesScreenState extends State<ResearchesScreen> {
//   @override
//   void initState() {
//     BlocProvider.of<MainCubit>(context).fetchResearches();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MainCubit(),
//       child: BlocConsumer<MainCubit, MainStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           MainCubit cubit = MainCubit.get(context);
//
//           return Scaffold(
//             body: cubit.researchesList.isEmpty
//                 ? CreatLoading()
//                 : ListView.builder(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     physics: BouncingScrollPhysics(),
//                     itemCount: cubit.researchesList.length,
//                     itemBuilder: (context, index) {
//                       Researches research = cubit.researchesList[index];
//
//                       String? Time =
//                           cubit.researchesList[index].researher!.createdAt;
//                       DateTime dateTime = DateTime.parse(Time!);
//                       return Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 8.0),
//                                 child: Text(
//                                   '${research.researchQuestion}',
//                                   style: BlackTitle.display5(context),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 8.0),
//                                 child: Text(
//                                   '${research.credits}',
//                                   style: BlackTitle.display5(context),
//                                 ),
//                               ),
//                               // Text(
//                               //   '$dateTime',
//                               //   style: BlackLabel.display5(context),
//                               // ),
//                               // Row(
//                               //   children: [
//                               //     Text(
//                               //       'New Requests',
//                               //       style: BlackTitle.display5(context),
//                               //     ),
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //     Container(
//                               //       width: 20,
//                               //       height: 20,
//                               //       decoration: BoxDecoration(
//                               //         border: Border.all(
//                               //           color: mainColor,
//                               //           width: 1.2,
//                               //         ),
//                               //         shape: BoxShape.rectangle,
//                               //       ),
//                               //       child: Text(
//                               //         '${cubit.researchesList[index].studentsStatus ?? 0}',
//                               //         style: TextStyle(),
//                               //         textAlign: TextAlign.center,
//                               //       ),
//                               //     ),
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //     IconButton(
//                               //       onPressed: () {},
//                               //       icon: Icon(
//                               //         Icons.arrow_circle_right_outlined,
//                               //         color: mainColor,
//                               //       ),
//                               //     ),
//                               //   ],
//                               // ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:research_app/common_widget/create_loading.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';

import '../../app_manager/local_data.dart';
import '../../model/researches_model.dart';
import '../../utilities/cache_helper.dart';
import '../../utilities/text_style.dart';

class ResearchesScreen extends StatefulWidget {
  @override
  _ResearchesScreenState createState() => _ResearchesScreenState();
}

class _ResearchesScreenState extends State<ResearchesScreen> {
  // late List<Researches> researchesList = [];

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
              : ListView.builder(
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

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                '${research.researchQuestion}',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                '${research.credits}',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            Text(
                              '$formattedDate',
                              style: BlackLabel.display5(context),
                            ),
                            Row(
                              children: [
                                Text(
                                  'New Requests',
                                  style: BlackTitle.display5(context),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 20,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: mainColor,
                                      width: 1.2,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Text(
                                    '${research.studentsStatus?.length ?? 0}',
                                    style: BlackLabel.display5(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_circle_right_outlined,
                                    color: mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

          // ListView.builder(
          //         itemCount: MainCubit.get(context).researchesList.length,
          //         itemBuilder: (context, index) {
          //           Researches research =
          //               MainCubit.get(context).researchesList[index];
          //           return ListTile(
          //             title: Text(research.researchQuestion ?? ''),
          //             subtitle: Text('Credits: ${research.credits ?? 0}'),
          //             onTap: () {
          //               // Handle onTap event
          //             },
          //           );
          //         },
          //       ),
        );
      },
    );
  }
}
