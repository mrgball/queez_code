import 'package:code_queez/features/quiz/domain/entity/answer.dart';

class AnswerModel extends Answer {
  const AnswerModel({
    required super.A,
    required super.B,
    required super.C,
    required super.D,
    super.E,
    super.F,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      A: json['answer_a'] ?? '',
      B: json['answer_b'] ?? '',
      C: json['answer_c'] ?? '',
      D: json['answer_d'] ?? '',
      E: json['answer_e'],
      F: json['answer_f'],
    );
  }
}
