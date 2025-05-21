import 'package:code_queez/features/quiz/domain/entity/correct_answer.dart';

class CorrectAnswerModel extends CorrectAnswer {
  const CorrectAnswerModel({
    required super.correctA,
    required super.correctB,
    required super.correctC,
    required super.correctD,
    required super.correctE,
    required super.correctF,
  });

  factory CorrectAnswerModel.fromJson(Map<String, dynamic> json) {
    return CorrectAnswerModel(
      correctA: json['answer_a_correct']?.toLowerCase() == 'true',
      correctB: json['answer_b_correct']?.toLowerCase() == 'true',
      correctC: json['answer_c_correct']?.toLowerCase() == 'true',
      correctD: json['answer_d_correct']?.toLowerCase() == 'true',
      correctE: json['answer_e_correct']?.toLowerCase() == 'true',
      correctF: json['answer_f_correct']?.toLowerCase() == 'true',
    );
  }
}
