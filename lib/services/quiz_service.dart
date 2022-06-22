import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quiz_app/model/quiz_model.dart';
class QuizService{

  final Dio _dio = Dio();
  String baseUrl =  "https://opentdb.com/api.php?amount=10&type=multiple";

  Future<QuizModel> fetchQuestions() async{

    try {
      Response response = await _dio.get(baseUrl);
      QuizModel quizModel = QuizModel.fromJson(response.data);
      return quizModel;

    }catch (e) {
      // TODO
      throw Exception(e);
    }

  }
}