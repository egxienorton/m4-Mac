class QuizModel {
  final String category; 
  final String difficulty; 
  final String question;
  final String correctAnswer;
  final List<String> answers;

  const QuizModel({required this.answers, required this.category, required this.correctAnswer, required this.difficulty, required this.question});
}