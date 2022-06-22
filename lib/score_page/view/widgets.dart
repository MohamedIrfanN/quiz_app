import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constatnts/constraints.dart';
import '../../feature/homepage/view/homepage_view.dart';
import '../../feature/quizpage/controller/quiz_controller.dart';

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

Widget score() {
  final controller = Get.find<QuizController>();
  return Column(
    children: [
      const Text("Your Score Is",
        style: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400),),
      SizedBox(
        height: height*0.01,
      ),
      Text("${controller.marks.toString()}/100",
        style: const TextStyle(
            fontSize: 35, color: Colors.black, fontWeight: FontWeight.w500),)
    ],
  );
}


Widget retakeButton() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.2),
    child: ElevatedButton(
      onPressed: () => Get.offAll(()=> const HomePageView()),
      style: ElevatedButton.styleFrom(
          primary: Colors.orangeAccent,
          padding: EdgeInsets.symmetric(horizontal: width * 0.1)),
      child: const Text(
        "RETAKE TRIVIA",
        style: TextStyle(
            color: Color(0xFF22518a),
            fontSize: 16,
            fontWeight: FontWeight.w700),
      ),),
  );
}