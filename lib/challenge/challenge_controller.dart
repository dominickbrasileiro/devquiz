import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentIndexNotifier = ValueNotifier<int>(0);
  int get currentIndex => currentIndexNotifier.value;
  set currentIndex(int value) => currentIndexNotifier.value = value;

  final scoreNotifier = ValueNotifier<int>(0);
  int get score => scoreNotifier.value;
  set score(int value) => scoreNotifier.value = value;
}
