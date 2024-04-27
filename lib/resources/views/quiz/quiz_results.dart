import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/App/Controllers/Quiz/quiz_controller.dart';
import 'package:xiphone/App/Models/quiz_model.dart';

import '../../../App/Controllers/Quiz/quiz_state.dart';
import '../../ui_presets/buttons/custom_buttons.dart';

class QuizResults extends ConsumerWidget {
  final QuizState state;
  final List<QuizModel> questions;

  const QuizResults({
    Key? key,
    required this.state,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizController = ref.watch(quizControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        CustomButton(
          title: 'New Quiz',
          onTap: () {
            // context.refresh(quizRepositoryProvider);
            // quizControllerProvider.re();
          },
        ),
      ],
    );
  }
}
