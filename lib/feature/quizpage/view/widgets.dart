import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constatnts/constraints.dart';
import '../controller/quiz_controller.dart';

Widget question(){
  final controller = Get.find<QuizController>();
  String question = controller.quiz!.results![controller.qNo.value].question!;
  return Container(
    padding: EdgeInsets.symmetric(vertical: 1.h),
    child:  Text(question,
      style: const TextStyle(color: Colors.black,fontSize: 14),
    ),
  );
}

Widget buildOptions(){
  final controller = Get.find<QuizController>();
  return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.allOptions[controller.qNo.value].length,
      itemBuilder: (context, index){
        final option = controller.allOptions[controller.qNo.value][index];
        final answer = controller.quiz!.results![controller.qNo.value].correctAnswer;
        return options(option,answer);
      });
}

Widget options(String option, String? answer){
  final controller = Get.find<QuizController>();
  return ListTile(
    title: Text(option,style: const TextStyle(fontSize: 15),),
    leading: Obx(()=>
        Radio(
            value: option,
            groupValue: controller.selectedOption.value,
            onChanged: (value){
              controller.selectedOption.value = value.toString();
            }),
    ),
  );
}

Widget nextButton(BuildContext context) {
  final controller = Get.find<QuizController>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {
            if(controller.allOptions[controller.qNo.value].contains(controller.selectedOption.value)){
              controller.addMarks();
              controller.nextQuestion();
            }else{
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,),
          icon: const Icon(
            Icons.arrow_right_alt_rounded,
            color: Colors.black,
            size: 33,
          ),
          label: const Text(
            "Next",
            style: TextStyle(
                color: Color(0xFF22518a),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ],
  );
}

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