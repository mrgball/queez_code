import 'package:code_queez/features/quiz/domain/entity/user_answer.dart';

class UserAnswerModel extends UserAnswer {
  const UserAnswerModel({
    required super.index,
    required super.answer,
  });

  factory UserAnswerModel.fromJson(Map<String, dynamic> json) =>
      UserAnswerModel(
        index: json['index'] ?? 0,
        answer: json['answer'],
      );

  @override
  List<Object?> get props => [index, answer];
}
