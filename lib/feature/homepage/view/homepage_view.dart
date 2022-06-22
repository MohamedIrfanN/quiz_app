import 'package:flutter/material.dart';
import 'package:quiz_app/feature/homepage/view/widgets.dart';
import '../../../constatnts/constraints.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(),
          kSizedBox,
          takeTriviaButton(),
        ],
      ),
    );
  }
}

