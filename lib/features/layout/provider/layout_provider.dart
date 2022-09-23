import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/nav_item.dart';

final layoutProvider = ChangeNotifierProvider<LayoutProvider>((ref) {
  return LayoutProvider();
});

class LayoutProvider extends ChangeNotifier {
  late final List<NavItem> pagesList = NavItem.navPages();

  NavItem get currentItem => pagesList[_index];

  bool isCurrentPage(NavItem item) => currentItem.pageName == item.pageName;

  int _index = 0;
  int get index => _index;

  void refresh() {
    notifyListeners();
  }

  void goToHome() => selectIndex(0);

  bool get isHome => index == 0;

  void selectIndex(int index) {
    _index = index;
    notifyListeners();
  }

  bool _canExit = false;
  bool get canExit => _canExit;
  void setCanExit() {
    _canExit = true;
    Future.delayed(const Duration(seconds: 2), () {
      _canExit = false;
    });
  }
}
