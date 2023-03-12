import 'package:flutter/material.dart';

class HomeScreenStateModel {
  int activeIndex;

  HomeScreenStateModel({this.activeIndex = 0});

  HomeScreenStateModel copyWith(
      {TabController? tabController, int? activeIndex}) {
    return HomeScreenStateModel(activeIndex: activeIndex ?? this.activeIndex);
  }
}
