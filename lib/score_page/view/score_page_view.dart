import 'package:flutter/material.dart';
import 'package:quiz_app/score_page/view/widgets.dart';
import '../../constatnts/constraints.dart';

class ScorePageView extends StatelessWidget {
  const ScorePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            kSizedBox,
            title(),
            SizedBox(
              height: height*0.2,
            ),
            score(),
            SizedBox(
              height: height*0.15,
            ),
            retakeButton()
          ],
        ),
      ),
    );
  }
}


