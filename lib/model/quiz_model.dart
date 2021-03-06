// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

import 'package:html_unescape/html_unescape.dart';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  QuizModel({
    this.responseCode,
    this.results,
  });

  int? responseCode;
  List<Result>? results;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    responseCode: json["response_code"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  String? category;
  Type? type;
  Difficulty? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"],
    type: typeValues.map![json["type"]],
    difficulty: difficultyValues.map![json["difficulty"]],
    question: HtmlUnescape().convert(json["question"]),
    correctAnswer: HtmlUnescape().convert(json["correct_answer"]),
    incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => HtmlUnescape().convert(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "type": typeValues.reverse![type],
    "difficulty": difficultyValues.reverse![difficulty],
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": List<dynamic>.from(incorrectAnswers!.map((x) => x)),
  };
}

enum Difficulty { HARD, EASY, MEDIUM }

final difficultyValues = EnumValues({
  "easy": Difficulty.EASY,
  "hard": Difficulty.HARD,
  "medium": Difficulty.MEDIUM
});

enum Type { MULTIPLE }

final typeValues = EnumValues({
  "multiple": Type.MULTIPLE
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
