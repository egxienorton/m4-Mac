import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/App/Models/quiz_model.dart';




final quizProvider = Provider((ref){
  return quizzes;
});
List<QuizModel> quizzes = [
  QuizModel(
      answers: [
        "Royal Oak",
        "White Hart", 
        "King&#039;s Head"
      ],
      category: 'General Knowledge',
      correctAnswer: "Royal Oak",
      difficulty: "medium",
      question: 'What is the most common pub name in the UK? '),
  QuizModel(
      answers: [
        "Chinaza",
        "Chima", 
        "King&#039;s Head"
      ],
      category: 'General Knowledge',
      correctAnswer: "Chima",
      difficulty: "medium",
      question: 'What is the most common name in the Naija? '),
  QuizModel(
      answers: [
        "Royal Oak",
        "Amadin", 
        "King&#039;s Head"
      ],
      category: 'General Knowledge',
      correctAnswer: "Amadin",
      difficulty: "medium",
      question: 'What is the most common name in the Benin City? ')
];
