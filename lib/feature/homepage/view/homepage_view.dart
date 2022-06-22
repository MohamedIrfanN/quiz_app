import 'package:flutter/material.dart';
import 'package:quiz_app/feature/homepage/view/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import '../../quizpage/view/quiz_page_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(),
          SizedBox(height: 5.h,),
          takeTriviaButton(),
        ],
      ),
    );
  }


  Widget takeTriviaButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
          onPressed: () => Get.to(()=> QuizPageView()),
          style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(horizontal: 5.w)),
          child: Row(
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
}

