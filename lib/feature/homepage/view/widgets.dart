import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

Widget takeTriviaButton() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.2),
    child: ElevatedButton(
        onPressed: () => Get.to(()=> QuizPageView()),
        style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
            padding: EdgeInsets.symmetric(horizontal: width * 0.05)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  "TAKE TRIVIA",
                  style: TextStyle(
                      color: Color(0xFF22518a),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Colors.black,
                  size: 33,
                ))
          ],
        )),
  );
}