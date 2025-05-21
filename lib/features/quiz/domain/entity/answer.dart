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
