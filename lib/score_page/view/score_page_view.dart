import 'package:flutter/material.dart';
import 'package:quiz_app/score_page/view/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
              height: 20.h,
            ),
            score(),
            SizedBox(
              height: 15.h,
            ),
            retakeButton()
          ],
        ),
      ),
    );
  }
}


