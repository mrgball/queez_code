import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/config/extension.dart';
import 'package:code_queez/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/domain/entity/category.dart';

class QuizScreen extends StatefulWidget {
  final Category category;
  final DifficultyType difficulty;

  const QuizScreen({
    super.key,
    required this.category,
    required this.difficulty,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // final int currentQuestion = 2;
  // final int totalQuestions = 5;
  // final double progress = currentQuestion / totalQuestions;

  @override
  void initState() {
    super.initState();

    context.read<QuizBloc>().add(
          GetQuizQuestionsEvent(
            category: widget.category,
            difficulty: widget.difficulty,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocSelector<QuizBloc, QuizState, QuizState>(
                selector: (state) => state,
                builder: (context, state) {
                  return Text('data list question : ${state.questions.length}');
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.tealGreen.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      ),
                      color: context.textDarkDark,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: context.tealGreenDark.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '00:00',
                          style: context.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
