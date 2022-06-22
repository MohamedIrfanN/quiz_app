import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_app/constatnts/constraints.dart';
import 'package:get/get.dart';
import 'package:quiz_app/feature/quizpage/controller/quiz_controller.dart';
import 'package:quiz_app/feature/quizpage/view/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class QuizPageView extends StatelessWidget {
  QuizPageView({Key? key}) : super(key: key);

  final controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      WillPopScope(
        onWillPop: () {
          return controller.back();
        },
        child: Scaffold(
          body: controller.isLoading.value ? loading
              :
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBox,
                    title(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Question ${controller.qNo.value+1}",style: const TextStyle(color: Colors.blueGrey,fontSize: 15),),
                    question(),
                    kSizedBox,
                    const Text("Choices",style: TextStyle(color: Colors.blueGrey,fontSize: 15),),
                    buildOptions(),
                    nextButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





