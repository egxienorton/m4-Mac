
import 'package:xiphone/App/Models/quiz_model.dart';

abstract class BaseQuizRepository {
  List<QuizModel> getQuestions({
    int numQuestions,
    int categoryId,
    String difficulty
  });
}