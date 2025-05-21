import 'package:equatable/equatable.dart';

class CorrectAnswer extends Equatable {
  final bool correctA;
  final bool correctB;
  final bool correctC;
  final bool correctD;
  final bool correctE;
  final bool correctF;

  const CorrectAnswer({
    required this.correctA,
    required this.correctB,
    required this.correctC,
    required this.correctD,
    required this.correctE,
    required this.correctF,
  });

  @override
  List<Object?> get props => [
        correctA,
        correctB,
        correctC,
        correctD,
        correctE,
        correctF,
      ];
}
