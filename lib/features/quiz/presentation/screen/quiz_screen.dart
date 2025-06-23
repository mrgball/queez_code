import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/config/extension.dart';
import 'package:code_queez/core/shared/widget/background_graphic.dart';
import 'package:code_queez/core/shared/widget/custom_button.dart';
import 'package:code_queez/features/quiz/domain/entity/question.dart';
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
  late final QuizBloc _quizBloc = context.read<QuizBloc>();
  final ValueNotifier<String?> _selectedAnswer = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    _quizBloc.add(GetQuizQuestionsEvent(
      category: widget.category,
      difficulty: widget.difficulty,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackgroundGraphicView(
              color: context.tealGreenDark.withOpacity(0.05),
            ),
          ),
          SafeArea(
            child: BlocSelector<QuizBloc, QuizState, QuizState>(
              selector: (state) => state,
              builder: (context, state) {
                final questions = state.questions;
                final currentIndex = state.currentQuestionIndex;

                final Question? currentSoal =
                    (questions.isNotEmpty && currentIndex < questions.length)
                        ? questions[currentIndex]
                        : null;

                if (state.status == BlocStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == BlocStatus.error || currentSoal == null) {
                  return const Center(
                      child: Text('Soal tidak tersedia atau error'));
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    children: [
                      ..._buildHeader(state),
                      SizedBox(height: context.screenHeight * 0.03),
                      _buildSoal(currentSoal),
                      SizedBox(height: context.screenHeight * 0.02),
                      _buildAnswer(currentSoal),
                      const Spacer(),
                      ValueListenableBuilder(
                        valueListenable: _selectedAnswer,
                        builder: (context, selectedAnswer, child) {
                          return CustomButton(
                            text: 'Submit Answer',
                            onPressed: () async {
                              await showCustomDialog(
                                currentSoal,
                              );
                            },
                            height: 52,
                            isLoading: state.status == BlocStatus.loading,
                            backgroundColor: context.tealGreenDark,
                            isDisabled: _selectedAnswer.value == null,
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> showCustomDialog(
    Question currentSoal,
  ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: context.textDark.withOpacity(0.3),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Answer Confirmation',
                      style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: context.textDark),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'After submitting, your choice will be locked. Make sure everything looks good!',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Cancel",
                            onPressed: () => Navigator.of(context).pop(),
                            variant: ButtonVariant.outlined,
                            backgroundColor: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                              text: "Yes",
                              backgroundColor: context.tealGreen,
                              onPressed: () {
                                if (_selectedAnswer.value == null) return;

                                _quizBloc.add(
                                  AnswerProccessingEvent(
                                    question: currentSoal,
                                    answer: _selectedAnswer.value!,
                                  ),
                                );
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Close button (pojok kanan atas)
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnswer(Question data) {
    final answers = data.answers.toList();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final answerText = answers[index];

        if (answerText.isEmpty) {
          return const SizedBox.shrink();
        }

        return ValueListenableBuilder<String?>(
          valueListenable: _selectedAnswer,
          builder: (context, selectedAnswer, child) {
            final isSelected =
                (selectedAnswer != null) && (selectedAnswer == answerText);

            return ListTile(
              trailing: Icon((isSelected) ? Icons.check : null),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              selected: isSelected,
              selectedTileColor: context.tealGreenLight,
              selectedColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: (isSelected)
                      ? Colors.transparent
                      : context.tealGreenDark.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              tileColor: Colors.white,
              horizontalTitleGap: 0,
              minLeadingWidth: 0,
              title: Text(
                answerText,
                style: context.textTheme.titleMedium?.copyWith(
                  color: (isSelected) ? Colors.white : context.tealGreenDark,
                  fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              onTap: () {
                if (isSelected) {
                  _selectedAnswer.value = null;
                  return;
                }

                _selectedAnswer.value = '';
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSoal(Question data) {
    return Text(
      data.question,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.textDark,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  List<Widget> _buildHeader(QuizState state) {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Tombol Back
          Container(
            decoration: BoxDecoration(
              color: context.tealGreen.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Nama kategori + progress bar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.category.name,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.textDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Soal counter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: context.tealGreenDark.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '${state.currentQuestionIndex + 1}/${state.questions.length} soal',
              style: context.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 24),
      SizedBox(
        width: double.infinity,
        child: LinearProgressIndicator(
          value: (state.questions.isEmpty)
              ? null
              : (state.currentQuestionIndex + 1) / (state.questions.length),
          borderRadius: BorderRadius.circular(18),
          backgroundColor: context.tealGreenLight.withValues(alpha: 0.5),
          color: context.tealGreenDark,
          semanticsLabel: 'Progress',
          valueColor: AlwaysStoppedAnimation<Color>(context.tealGreenLight),
          minHeight: 7,
        ),
      ),
    ];
  }
}
