import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/App/Controllers/Quiz/quiz_state.dart';
import 'package:xiphone/App/Models/quiz_model.dart';

final quizControllerProvider = StateNotifierProvider.autoDispose<QuizController, QuizState>((ref) {
  return QuizController();
});

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void submitAnswer(QuizModel currentQuestion, String answer) {
    // if(state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct..add(currentQuestion),
        status: QuizStatus.correct,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct..add(currentQuestion),
        status: QuizStatus.incorrect,
      );
    }
  }

  void nextQuestion(List<QuizModel> questions, int currentIndex) {
    state = state.copyWith(
        selectedAnswer: '',
        status: currentIndex + 1 < questions.length
            ? QuizStatus.initial
            : QuizStatus.complete);
  }

  void reset() {
    state = QuizState.initial();
  }
}
