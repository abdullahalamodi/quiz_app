import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentQuestionIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
