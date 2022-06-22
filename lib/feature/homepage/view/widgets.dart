import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constatnts/constraints.dart';
import '../../quizpage/view/quiz_page_view.dart';

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        "TRIVIA APP",
        style: TextStyle(
            fontSize: 35, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

