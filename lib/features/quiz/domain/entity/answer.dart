import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String A;
  final String B;
  final String? C;
  final String? D;
  final String? E;
  final String? F;

  const Answer({
    required this.A,
    required this.B,
    this.C,
    this.D,
    this.E,
    this.F,
  });

  List<String> toList() {
    return [
      A,
      B,
      if (C != null) C!,
      if (D != null) D!,
      if (E != null) E!,
      if (F != null) F!
    ];
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
