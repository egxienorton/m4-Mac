import 'package:xiphone/App/Models/quiz_model.dart';

enum QuizStatus { initial, correct, incorrect, complete }

class QuizState {
  final String selectedAnswer;
  final List<QuizModel> correct;
  final List<QuizModel> incorrect;
  final QuizStatus status;

  const QuizState(
      {required this.selectedAnswer,
      required this.correct,
      required this.incorrect,
      required this.status});

  factory QuizState.initial() {
    return QuizState(
        selectedAnswer: '',
        correct: [],
        incorrect: [],
        status: QuizStatus.initial);
  }
  // Omo - try dey use dart data class generator- this copy with method no be here

  QuizState copyWith(
      {String? selectedAnswer,
      List<QuizModel>? correct,
      List<QuizModel>? incorrect,
      QuizStatus? status}) {
    return QuizState(
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        correct: correct ?? this.correct,
        incorrect: incorrect ?? this.incorrect,
        status: status ?? this.status);
  }

  //! Omo - dunno what this guy is used for..
  @override
  List<Object> get props => [selectedAnswer, correct, incorrect, status];
}
