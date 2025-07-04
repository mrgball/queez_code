import 'package:equatable/equatable.dart';

class UserAnswer extends Equatable {
  final int index;
  final String answer;

  const UserAnswer({
    required this.index,
    required this.answer,
  });

  UserAnswer copyWith({
    int? index,
    String? answer,
  }) =>
      UserAnswer(
        index: index ?? this.index,
        answer: answer ?? this.answer,
      );

  String get finalAnswer => (index == 0)
      ? 'A'
      : (index == 1)
          ? 'B'
          : (index == 2)
              ? 'C'
              : (index == 3)
                  ? 'D'
                  : (index == 4)
                      ? 'E'
                      : 'F';

  @override
  List<Object?> get props => [
        index,
        answer,
      ];
}
