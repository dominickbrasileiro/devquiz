import 'package:devquiz/common/models/quiz_model.dart';
import 'package:devquiz/common/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';
import 'home_state.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  Future getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();

    state = HomeState.success;
  }

  Future getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();

    state = HomeState.success;
  }
}
