import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';

class NewForm extends StatelessWidget {
  const NewForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  // question 1
                  Text("q"),

                  /////////////////////////////////////// answers ///////////////////

                  Row(
                    children: [
                      Text('a'),
                      Checkbox(
                          value: cubit.isFirstQuestionChecked,
                          onChanged: (x) => cubit.onFirstChanged(0, 'a')),
                    ],
                  ),
                  Row(
                    children: [
                      Text('s'),
                      Checkbox(
                          value: cubit.isSecondQuestionChecked,
                          onChanged: (v) => cubit.onFirstChanged(1, 'b')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
