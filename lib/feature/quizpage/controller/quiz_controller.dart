import 'package:get/get.dart';
import 'package:quiz_app/score_page/view/score_page_view.dart';
import '../../../model/quiz_model.dart';
import '../../../services/quiz_service.dart';

class QuizController extends GetxController{


  RxBool isLoading = false.obs;
  QuizModel? quiz;
  RxString selectedOption = "".obs;
  String? answer;
  RxInt qNo = 0.obs;
  int marks = 0;
  List<String> selectedAnswers = [];
  List<List<String>> allOptions = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadQuiz();
  }



  loadQuiz() async{
    showLoading();
    quiz = await QuizService().fetchQuestions();
    await setOptions();
    hideLoading();
  }

  setOptions() {
    if(qNo.value == allOptions.length){
      List<String> options = [];
      options = quiz!.results![qNo.value].incorrectAnswers!.toList();
      options.add(quiz!.results![qNo.value].correctAnswer!);
      options.shuffle();
      allOptions.insert(qNo.value, options.toList());
    }
  }

  nextQuestion() {
    if(qNo.value < 9 ){
      addToSelectedAnswers();
      qNo.value++;
      setOptions();
      selectedOption.value = qNo.value < selectedAnswers.length ? selectedAnswers[qNo.value] : "";
    }else{
      Get.offAll(()=> const ScorePageView());
    }
  }

  addToSelectedAnswers(){
    if(qNo.value == selectedAnswers.length){
      selectedAnswers.insert(qNo.value, selectedOption.value);
    }else{
      selectedAnswers[qNo.value] = selectedOption.value;
    }
  }

  addMarks(){
    if(qNo.value < selectedAnswers.length) {
      if (selectedOption.value != selectedAnswers[qNo.value]) {
        if (selectedOption.value == quiz!.results![qNo.value].correctAnswer) {
          marks = marks + 10;
        } else if (selectedAnswers[qNo.value] ==
            quiz!.results![qNo.value].correctAnswer) {
          marks = marks - 10;
        }
      }
    }else if(selectedOption.value == quiz!.results![qNo.value].correctAnswer){
      marks = marks+10;
    }
  }

  back(){
    if(qNo.value > 0){
      qNo.value--;
      selectedOption.value = selectedAnswers[qNo.value];
      setOptions();
    }
  }

  showLoading() => isLoading.toggle();
  hideLoading() => isLoading.toggle();


}