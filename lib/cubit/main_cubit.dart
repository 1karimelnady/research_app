import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_states/main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);
}
