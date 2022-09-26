import 'package:flutter_riverpod/flutter_riverpod.dart';

final skipProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});
