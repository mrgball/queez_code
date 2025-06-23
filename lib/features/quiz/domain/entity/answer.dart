import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String A;
  final String B;
  final String C;
  final String D;
  final String? E;
  final String? F;

  const Answer({
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    this.E,
    this.F,
  });

  List<String> toList() {
    return [A, B, C, D, if (E != null) E!, if (F != null) F!];
  }

  @override
  List<Object?> get props => [
        A,
        B,
        C,
        D,
        E,
        F,
      ];
}
