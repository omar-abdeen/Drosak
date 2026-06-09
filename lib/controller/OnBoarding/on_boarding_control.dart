import 'dart:async';

import 'package:drosak/core/resources/const_values.dart';
import 'package:drosak/core/resources/routes_mananger.dart';
import 'package:flutter/cupertino.dart';

class OnBoardingControl {
  int currentIndex = 0;
  PageController pageControllerOnBoardingControl = PageController(
    initialPage: 0,
  );
  late StreamController<int> streamControllerDotIndicator;
  late Sink<int> inputDotIndicator;
  late Stream<int> outputDotIndicator;

  OnBoardingControl() {
    streamControllerDotIndicator = StreamController<int>();
    inputDotIndicator = streamControllerDotIndicator.sink;
    outputDotIndicator = streamControllerDotIndicator.stream;
    inputDotIndicator.add(currentIndex);
  }

  void dispose() {
    streamControllerDotIndicator.close();
    inputDotIndicator.close();
  }

  void goNext() {
    if (currentIndex + 1 >= ConstListValues.listOnBoardingModel.length) {
      currentIndex = 0;
    } else {
      currentIndex++;
    }
    pageControllerOnBoardingControl.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    inputDotIndicator.add(currentIndex);
  }

  void skip(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(RoutesName.kExploreAppScreen,);
  }
}
